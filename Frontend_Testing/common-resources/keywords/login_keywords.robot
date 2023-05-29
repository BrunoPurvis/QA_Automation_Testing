*** Settings ***
Documentation   Definition of variables used in the e-commerce "Saucedemo" test suite.

Library  String
Library  Collections
Library  SeleniumLibrary

Resource  ${CURDIR}${/}saucedemo_keywords.robot
Resource  ${CURDIR}${/}..${/}locators${/}locators.robot

*** keywords ***
Login as a standard user

    Login with valid credentials     ${standard_user}     ${password}
    

Login
    [Arguments]     ${username}   ${password}

    Input Text               ${xpathInputUsername}    ${username}
    Input Password           ${xpathInputPassword}    ${password}
    Click Button             ${xpathLoginButton}

    
    
Login with valid credentials
    [Arguments]    ${username}   ${password}

    Go to Login Page
    Login   ${username}   ${password}
    Wait Until Location Is   ${urlInventory}   timeout=5s

    
    
Login with invalid credentials
    [Arguments]    ${username}   ${password}   ${expectedErrorMessage}
    
    Go to Login Page
    Login   ${username}   ${password}
    Validate error message on login Page   ${expectedErrorMessage}   

  

Go to Login Page
    
    ${currentURL}=  Get Location
    
    Run Keyword If    '${currentURL}'!='${urlLogin}'
    ...          Run Keywords  
    ...          Go To    ${urlLogin}
    ...    AND   Wait Until Location Is   ${urlLogin}    timeout=5s
    ...    ELSE
    ...    Reload Page
    


Validate error message on login Page
    [Arguments]   ${expectedErrorMessage}
    
    ${h3ErrorElement}=   Replace String    ${h3ErrorElement}    error message    ${expectedErrorMessage}
    Page Should Contain Element    ${h3ErrorElement}

    # validating that we are still on the login page because we were not able to login successfully
    ${currentURL}=   Get Location
    Should Be Equal    ${currentURL}    ${urlLogin}    
    


Logout     

    Open Left Menu
    Click Element    ${xpathLogoutButton}
    Wait Until Location Is    ${urlLogin}   timeout=5s