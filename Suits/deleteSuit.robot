*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    DateTime
Resource    ../Resources/resources.robot
Variables    ../Resources/data.py

*** Test Cases ***

Deleting User
    [Documentation]    This test delets an user by his ID
    Creating the session
    ${response}=    Deleting user by ID

    #VALIDATIONS
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    204

    ${response_body}=    Convert To String     ${response.content}
    Should Be Empty    ${response_body}