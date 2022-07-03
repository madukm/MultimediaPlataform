from database import Postgres

db = None

query = {
    'mestre': """INSERT INTO mestre(email, nome, data_nasc, telefone) VALUES(%s,%s,%s,%s);""",
    'coordenador': """SELECT nome FROM coordenador WHERE classe = %s""",
    'universitario': """SELECT nome FROM universitario WHERE email = %s""",
    'solicitacao': """INSERT INTO solicitacao(universitario, coordenador, solicitacao) VALUES(%s, %s, %s);"""  
}

def login(mestre):
    while(True):
        email = input("""Informe seu email: """)
        if not mestre: # Universitario
            name = db.query(query['universitario'], (email,))
            if name != None:
                print(f"Bem vindo(a) de volta {name[0]}!\n")
                return (email, name)
            else:
                print("Este email não está cadastrado. Tente novamente!\n")


if __name__ == "__main__":
    
    db = Postgres()

    print("""
    BEM VINDO(A) à plataforma de tutoriais para apoio a universitários!!!
    """)

    while True:
        func = int(input(
"""Selecione uma funcionalidade:   
    1 - FAZER UMA SOLICITAÇÃO
    2 - BUSCAR O NOME
    3 - SAIR DO SISTEMA
"""))

        if func == 1:
            print("Faça seu login para realizar uma solicitação!")
            # Checking if the email is on the db
            email, nome = login(False)
            classe = int(input(
"""Sua solicitação é destinada a que classe?
    1 - Professor
    2 - Chef
    3 - Faxineiro
    4 - Farmacêutico
"""))
            solicitacao = input("Qual solicitação você deseja enviar? Por favor, escreva em até 200 caracteres.\n")
            # Erro caso não haja um coordenador da classe em vigência
            if not db.query(query["coordenador"], (classe,)):
                print("Não é possível enviar solicitações no momento. Por favor, tente mais tarde.\n")
                continue
            if db.query(query["solicitacao"], (uni, classe, solicitacao)):
                print("Sua solicitação foi cadastrada!\n")

        elif func == 2: # Atribuir uma solicitação ao mestre com menos solicitações
            print("Faça seu login para recomendar um tutorial!\n")
            uni = login(False)
            
        elif func == 3: # Sair do sistema
            del db
            print("Saindo... \n")
            break
        
        else:
            print("Função inválida!\n")