*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    DateTime
Resource    ../Resources/resources.robot
Variables    ../Resources/data.py

*** Test Cases ***

Updating User
    [Documentation]    This test udaptes an user by his ID
    Creating the session
    ${response}=    Updating user by ID

    #VALIDATIONS
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${response_body}=    Convert To String     ${response.content}
    Should Contain    ${response_body}    date 