*** Settings ***
Resource  ../../resources/common.resource
Resource  ../../resources/cadastro/cadastro.resource


*** Test Cases ***
Caso de teste 01: cadastrar um cliente com sucesso
    Acessar a Pagina de Cadastro
    Digitar os Valores para Cadastro
    Clicar no Botão Cadastrar
    Entao deve aparecer a mensagem 'Cadastrado com sucesso'

Caso de teste 02: cadastrar um cliente com email invalido
    Acessar a Pagina de Cadastro
    Digitar os Valores para Cadastro
    Digitar o email invalido
    Clicar no Botão Cadastrar
    Entao deve aparecer o erro 'Email inválido'
