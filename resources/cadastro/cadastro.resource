*** Settings ***
Library     SeleniumLibrary
Library     uuid  # Importa a biblioteca uuid

*** Variables ***
${URL}                  http://localhost:8000/
${BROWSER}              Chrome
${INPUT_USERNAME}       username
${INPUT_NOME}           nome
${INPUT_SOBRENOME}      sobrenome
${INPUT_EMAIL}          email
${INPUT_PASS}           password
${BTN_CADASTRAR}        //*[@id="root"]/div/div/div/div/form/div/div[6]/button
${LABLE_CADASTRO}       //*[@id="root"]/div/div/div/div/form/div[2]/div

*** Keywords ***
Acessar a Pagina de Cadastro
    Open Browser    url=${URL}      browser=${BROWSER}
    Title Should Be    Vite + React + TS

Generate UUID
    ${uuid}    Evaluate    str(uuid.uuid4())  # Gera um UUID v4 como uma string
    [Return]    ${uuid}

Digitar os Valores para Cadastro
    ${selected_text}=    Generate UUID
    Log    O UUID gerado é: ${selected_text}
    Input Text    ${INPUT_USERNAME}     teste123
    Input Text    ${INPUT_NOME}         teste123
    Input Text    ${INPUT_SOBRENOME}    teste123
    Input Text    ${INPUT_EMAIL}        ${selected_text}@teste.com
    Input Text    ${INPUT_PASS}         ${selected_text}

Digitar o email invalido
	Input Text    ${INPUT_EMAIL}        teste@teste

Clicar no Botão Cadastrar
    Click Element    ${BTN_CADASTRAR}
    Sleep    1

Entao deve aparecer a mensagem '${TEXTO_CADASTRO}'
	    Wait Until Element Contains    ${LABLE_CADASTRO}    ${TEXTO_CADASTRO}

Entao deve aparecer o erro '${email_invalido}'
    Wait Until Element Is Visible    //div[@class="alert alert-danger"]
    ${error_message}    Get Text    //div[@class="alert alert-danger"]
    Wait Until Element Contains    ${error_message}    ${email_invalido}
