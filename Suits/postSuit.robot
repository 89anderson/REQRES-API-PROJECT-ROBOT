*** Settings ***
Library    Collections
Library    DateTime
Resource    ../Resources/resources.robot
Variables    ../Resources/data.py

*** Variables ***
#${base_url}=    https://reqres.in/api


*** Test Cases ***

Creating User Test
    Create Session    session    https://reqres.in/api    verify=true
    ${response}=    Creating an user
    #VALIDATIONS
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${response_body}=    Convert To String    ${response.content}
    should Contain     ${response_body}    4
    Should Contain    ${response_body}    QpwL5tke4Pnpja7X4
