*** Settings ***
Documentation    Test cases for login.
Resource         ../resources/keyword.robot
Library          SeleniumLibrary
Library          Collections
Library          OperatingSystem
Suite Setup      Open Browser    ${LOGIN_URL}    ${BROWSER}
# Suite Teardown   Close Browser

*** Variables ***
${BROWSER}                         Chrome
${TAG_LOGIN}                       LOGIN       
${LOGIN_URL}                       https://ch3plus.com/
${LIGHTBOX_ELEMENT}                id=cover-lightbox-close
${XPATH_USERNAME_ELEMENT}          //input[@id="username"]    
${EMAIL}                           sanyanee_t@becworld.com
${PASSWORD}                        ST-nann1911
${XPATH_PROFILE_IMAGE_ELEMENT}     //a[@class="profile-img"]  
${USER_AGENTS}                     Firefox 89.0|Chrome 91.0.4472.124|Safari 14.1|Edge 91.0.864.54  # Add more user agents as needed

*** Test Cases ***
TC-01 Login With Email And Password
    [Documentation]    Test login with Apple
    [Tags]                ${TAG_LOGIN}
    Close Lightbox        ${LIGHTBOX_ELEMENT}
    Click Login
    Select IFrame
    Wait Element          ${XPATH_USERNAME_ELEMENT}   
    Input Credentials     ${EMAIL}    ${PASSWORD}
    Click Login Button
    Wait Element          ${XPATH_PROFILE_IMAGE_ELEMENT}

# TC-02 Login With Apple
#     [Documentation]    Test login with Apple
#     [Tags]                ${TAG_LOGIN}
#     Close Lightbox
#     Click Login
#     Select IFrame
#     Click Apple Icon

*** Keywords ***
Close Lightbox
    [Arguments]    ${LIGHTBOX_ELEMENT}
    Click Button          ${LIGHTBOX_ELEMENT}          

Click Login
    Click Link            xpath=//div[@class="nav-group"]/div[@class="register"]/a

Select IFrame
    Select Frame          xpath=//iframe[@name="iframe-login"]

Wait Element
    [Arguments]    ${XPATH_ELEMENT}
    Wait Until Page Contains Element    ${XPATH_ELEMENT}   timeout=30

Input Credentials
    [Arguments]           ${USERNAME}    ${PASSWORD}           
    Input Text            xpath=//input[@id="username"]    ${USERNAME}
    Input Password        xpath=//input[@id="password"]    ${PASSWORD}

Click Login Button
    Click Button          xpath=//button[@type="submit"]

Click Apple Icon
    Click Link            xpath=//div[@class="social-login-container"]/a[@class="btn-login log-Apple"]
