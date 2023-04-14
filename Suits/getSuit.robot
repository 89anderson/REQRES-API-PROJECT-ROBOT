*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    DateTime
Resource    ../Resources/resources.robot
Variables    ../Resources/data.py

*** Test Cases ***

Getting User
    [Documentation]    This test get an user by his ID
    Creating the session
    ${response}=    Getting user by ID

    #VALIDATIONS
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${response_body}=    Convert To String    ${response.content}
    should Contain     ${response_body}    ${user_id}
    Should Contain    ${response_body}    eve.holt@reqres.in
    Should Contain    ${response_body}    eve