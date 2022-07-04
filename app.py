from database import Postgres

db = None

query = {
    'mestre': """INSERT INTO mestre(email, nome, data_nasc, telefone) VALUES(%s,%s,%s,%s);""",
    'coordenador': """SELECT c.mestre FROM coordenador c JOIN termo t 
                    ON c.mestre = t.coordenador 
                    WHERE UPPER(t.classe) = %s AND t.iniVigencia < CURRENT_DATE AND t.fimVigencia > CURRENT_DATE;""",
    'universitario': """SELECT nome FROM universitario WHERE email = %s;""",
    'solicitacao': """INSERT INTO solicitacao(universitario, coordenador, solicitacao) VALUES(%s,%s,%s) 
                        RETURNING TO_CHAR(data, 'HH:MI:SS" de "DD-MM-YYYY');""",
    'recomendacao': """SELECT u.nome, t.titulo FROM recomendar r JOIN 
                        tutorial t ON r.tutorial = t.id JOIN universitario u 
                        ON r.recomenda = u.email WHERE r.recebe = %s;"""
}

classes = {
    1: 'PROFESSOR', 
    2: 'CHEF', 
    3: 'FAXINEIRO', 
    4: 'FARMACEUTICO'
}
            
def login(mestre):
    while(True):
        email = input("""Informe seu email: """)
        if not mestre: # Universitario
            db.query(query['universitario'], (email,))
            name = db.cur.fetchone()
            if name:
                print(f"Bem vindo(a) de volta {name[0]}!\n")
                return (email, name)
            else:
                print("Este email não está cadastrado. Tente novamente!\n")

def solicitacao(universitario):
    classe = int(input(
"""Sua solicitação é destinada a que classe?
1 - Professor
2 - Chef
3 - Faxineiro
4 - Farmacêutico
"""))
    db.query(query["coordenador"], (classes[classe],))
    coordenador = db.cur.fetchone()
    if not coordenador:
        print("Não é possível enviar solicitações no momento. Por favor, tente mais tarde.\n")
        return
    mensagem = input("Qual solicitação você deseja enviar? Por favor, escreva em até 200 caracteres ou sua mensagem será cortada.\n")
    # Erro caso não haja um coordenador da classe em vigência
    db.query(query["solicitacao"], (universitario, coordenador[0], mensagem[:200]))
    data = db.cur.fetchone()
    if data:
        print(f"Sua solicitação foi enviada às {data[0]}!\n")
    else:
        print("Não foi possível concluir sua solicitação. Por favor, tente novamente!")


def recomendacoes(universitario):
    db.query(query["recomendacao"], (universitario,))
    rec = db.cur.fetchall()
    if not rec:
        print("Você não tem nenhuma recomendação.\n")
    else:
        count = 1
        print("Recomendações:")
        for nome, titulo in rec:
            print(f"{count}: {nome} te recomendou o tutorial '{titulo}'.\n")
            count += 1

if __name__ == "__main__":
    
    db = Postgres()

    print("""
BEM VINDO(A) à plataforma de tutoriais para apoio a universitários!!!
    """)

    while True:
        func = int(input(
"""Selecione uma funcionalidade:   
1 - FAZER UMA SOLICITAÇÃO
2 - VERIFICAR RECOMENDAÇÕES RECEBIDAS
3 - SAIR DO SISTEMA
Sua escolha: """))

        if func == 1:
            print("Faça seu login para realizar uma solicitação!")
            # Checking if the email is on the db
            email, _ = login(False)
            solicitacao(email)
    
        elif func == 2: # Consultar quais recomendações recebeu
            print("Faça seu login para checar todas suas recomendações!\n")
            email, nome = login(False)
            recomendacoes(email)
            
        elif func == 3: # Sair do sistema
            del db
            print("Já vai? Volte logo... \n")
            break
        
        else:
            print("Função inválida!\n")