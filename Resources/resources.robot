*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    DateTime
Variables    ./data.py

*** Keywords ***
date
    ${date}=    Get Current Date    UTC    exclude_millis=yes

Creating the session
    Create session    session    ${base_url}    verify=true

Creating an user
    [Documentation]    Por alguma razão sempre que envio o header no endpoint /register recebo um 400 como retorno. 
    ...    Com o Postman não é possível enviar a request sem header, mas no Robot isso funciona normalmente.
    

    ${header}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${body}=    Create Dictionary    email=${userMail}    password=${userPassword}
    ${response}=    POST On Session    session    /register    data=${body}
    [return]    ${response}

Getting user by ID
    ${response}=    GET On Session    session    /users/${user_id}
    [return]    ${response}

Deleting user by ID
    ${response}=    DELETE On Session    session    /users/${user_id}
    [return]    ${response}

Updating user by ID
    ${header}=    Create Dictionary    Accept=application/json
    ${body}=    Create Dictionary    email=${userMail}    password=${userNewPassword}
    ${response}=    PUT On Session    session    /users/${user_id}    data=${body}    headers=${header}
    [return]    ${response}