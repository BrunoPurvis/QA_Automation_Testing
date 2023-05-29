*** Settings ***
Documentation   A test suite containing test cases related to the e-commerce website: "https://www.saucedemo.com/"

Resource  ${CURDIR}${/}..${/}common-resources${/}variables${/}variables.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}login_keywords.robot

Test Template      Login with invalid credentials

Suite Setup        Run Keywords
...                Set Selenium Implicit Wait     2s
...      AND       Open Browser    browser=${browser}    url=${urlLogin}
...      AND       Wait Until Location Is   ${urlLogin}  timeout=5s
...      AND       Maximize Browser Window
Suite Teardown     Close all browsers


*** Test Cases ***
Reject_Login as a locked out user   ${locked_out_user}   ${password}   ${lockedUserErrorMessage}
    [Documentation]    A login attempt is made as a 'locked out user' and
    ...                it is expected to get the error message:
    ...                "Epic sadface: Sorry, this user has been locked out.".
    [Tags]             Saucedemo_Login_reject



Reject_Login with no username and valid password    ${EMPTY}   ${password}   ${usernameRequiredErrorMessage}
    [Documentation]    A login attempt is made with no username and valid
    ...                password and it is expected to get the error message:
    ...                "Epic sadface: Username is required".
    [Tags]             Saucedemo_Login_reject



Reject_Login with a valid username and no password   ${standard_user}   ${EMPTY}   ${passwordRequiredErrorMessage}
    [Documentation]    A login attempt is made with a valid username and no
    ...                password and it is expected to get the error message:
    ...                "Epic sadface: Password is required".
    [Tags]             Saucedemo_Login_reject



Reject_Login with no username and no password   ${EMPTY}   ${EMPTY}   ${usernameRequiredErrorMessage}
    [Documentation]    A login attempt is made with no username and no
    ...                password and it is expected to get the error message:
    ...                "Epic sadface: Username is required".
    [Tags]             Saucedemo_Login_reject


Reject_Login with invalid username and valid password   blablabla   ${password}   ${invalidCredentialsErrorMessage}
    [Documentation]    A login attempt is made with an invalid username and valid
    ...                password and it is expected to get the error message:  
    ...                "Epic sadface: Username and password do not match any user in this service".
    [Tags]             Saucedemo_Login_reject


Reject_Login with valid username and invalid password   ${standard_user}   blablabla   ${invalidCredentialsErrorMessage}
    [Documentation]    A login attempt is made with valid username and invalid
    ...                password and it is expected to get the error message:
    ...                "Epic sadface: Username and password do not match any user in this service".
    [Tags]             Saucedemo_Login_reject


Reject_Login with both invalid username and invalid password   invalid_username   invalid_password   ${invalidCredentialsErrorMessage}
    [Documentation]    A login attempt is made with an invalid username and invalid
    ...                password and it is expected to get the error message:
    ...                "Epic sadface: Username and password do not match any user in this service".
    [Tags]             Saucedemo_Login_reject