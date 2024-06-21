*** Settings ***
Library          SeleniumLibrary
Resource         ./variable.robot

*** Keywords ***
Sleep Time
    [Arguments]    ${TIME}
    Sleep    ${TIME}
Close Lightbox
    [Arguments]    ${LIGHTBOX_ELEMENT}
    Click Button          ${LIGHTBOX_ELEMENT}          

Click Login
    Click Link            xpath=//div[@class="nav-group"]/div[@class="register"]/a

Select IFrame
    [Arguments]    ${XPATH_IFRAME}
    Select Frame          xpath=${XPATH_IFRAME}

Wait Element
    [Arguments]    ${XPATH_ELEMENT}
    Wait Until Page Contains Element    xpath=${XPATH_ELEMENT}

Wait Element Visible
    [Arguments]    ${XPATH_VISIBLE_ELEMENT}
    # Sleep Time                       ${SLEEP_90S}
    Wait Until Element Is Visible    xpath=${XPATH_VISIBLE_ELEMENT} 

Input Credentials
    [Arguments]           ${USERNAME}    ${PASSWORD}        
    # Sleep Time            ${SLEEP_90S}
    Input Text            xpath=//input[@id="username"]    ${USERNAME}
    # Sleep Time            ${SLEEP_90S}
    Input Password        xpath=//input[@id="password"]    ${PASSWORD}

Click Login Button
    Click Button          xpath=//button[@type="submit"]

Click Apple Icon
    Click Link            xpath=//div[@class="social-login-container"]/a[@class="btn-login log-Apple"]
