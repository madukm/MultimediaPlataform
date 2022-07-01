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
Bem vindo à plataforma de tutoriais para apoio a universitários!!!
""")

while True:
    func = int(input("""Selecione uma funcionalidade:   
    1- CADASTRAR MESTRE
    5- SAIR DO SISTEMA
    """)) 
    print("\n")


    if func == 1: 
        email = input("Informe seu email:")
        nome = input("Informe seu nome:")
        data_nascimento = input("Informe sua data de nascimento (dd-mm-aaaa):")
        telefone = input("Informe seu telefone:")

        if not db.inserir_mestre(email, nome, data_nascimento, telefone):
            print(f"O mestre {nome} ({email}) foi adicionado ao banco.")
        print('\n')

    elif func == 2: # Sair do sistema
        print("Saindo... \n")
        break