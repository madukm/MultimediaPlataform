import db

def format_line(index, words):
    ret = ''
    length = 50
    for i in range(len(index)):
        string = str(index[i])+'- '+ words[i]
        for x in range(length - len(string)):
            string+=(" ")
        ret+=string

    return ret
        
"""Funcao que organiza e imprime itens de uma query"""
def print_format_line(elements):
    words = []
    index = []
    for i in range(len(elements)):
        words.append(elements[i])
        index.append(i)
        if (i+1)%3 == 0:
            print(format_line(index, words))
            words = []
            index = []
    print(format_line(index, words))
    words = []
    index = []

print("""
BEM VINDO(A) à plataforma de tutoriais para apoio a universitários!!!
""")

while True:
    func = int(input("""Selecione uma funcionalidade:   
    1 - CADASTRAR MESTRE
    2 - FAZER UMA SOLICITAÇÃO
    3 - RECOMENDAR UM TUTORIAL A OUTRO UNIVERSITÁRIO
    4 - SAIR DO SISTEMA
    """))
    print("\n")


    if func == 1: 
        email = input("Informe seu email:")
        nome = input("Informe seu nome:")
        data_nascimento = input("Informe sua data de nascimento (dd-mm-aaaa):")
        telefone = input("Informe seu telefone:")

        if db.inserir_mestre(email, nome, data_nascimento, telefone):
            print(f"O mestre {nome} ({email}) foi adicionado ao banco.")
        print('\n')

    elif func == 2:
        email_uni = input("""Faça seu login para realizar uma solicitação!
                            Informe seu email: """)
        # Checar se o email está cadastrado como universitário no bd
        classe = int(input("""Sua solicitação é destinada a que classe?
                            1 - Professor
                            2 - Chef
                            3 - Faxineiro
                            4 - Farmacêutico"""))
        solicitacao = input("""Qual solicitação você deseja enviar? Por favor, escreva em até 200 caracteres.""")
        # Erro caso não haja um coordenador atualmente da classe
        if db.cadastrar_solicitacao(email_uni, classe, solicitacao):
            print(f"Sua solicitação foi cadastrada!\n")    

    elif func == 3: # Recomendar tutorial
        pass

    elif func == 4: # Sair do sistema
        print("Saindo... \n")
        break
    
    else:
        print("Função inválida!\n")