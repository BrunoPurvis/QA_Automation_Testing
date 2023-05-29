*** Settings ***
Documentation   A test suite containing login sucess test cases related to the e-commerce website: "https://www.saucedemo.com/"

Resource  ${CURDIR}${/}..${/}common-resources${/}variables${/}variables.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}login_keywords.robot

Test Teardown      Logout
Test Template      Login with valid credentials

Suite Setup        Run Keywords
...                Set Selenium Implicit Wait     2s
...      AND       Open Browser    browser=${browser}   url=${urlLogin}
...      AND       Wait Until Location Is   ${urlLogin}     timeout=5s
...      AND       Maximize Browser Window
Suite Teardown     Close all browsers


*** Test Cases ***
Accept_Login as a standard user   ${standard_user}   ${password}
    [Documentation]    A login is made with the 'standard user' valid credentials
    ...                and it is validated in the 'Login with valid credentials'
    ...                keyword that we go to the inventory page. Then a logout is
    ...                done and it is validated that we go to the login page. 
    [Tags]             Saucedemo_Login_sucess



Accept_Login as a problem user   ${problem_user}   ${password}
    [Documentation]    A login is made with the 'problem user' valid credentials
    ...                and it is validated in the 'Login with valid credentials'
    ...                keyword that we go to the inventory page. Then a logout is
    ...                done and it is validated that we go to the login page. 
    [Tags]             Saucedemo_Login_sucess
    


Accept_Login as a performance glitch user   ${performance_glitch_user}   ${password}
    [Documentation]    A login is made with the 'performance glitch user' valid credentials
    ...                and it is validated in the 'Login with valid credentials'
    ...                keyword that we go to the inventory page. Then a logout is
    ...                done and it is validated that we go to the login page. 
    [Tags]             Saucedemo_Login_sucess