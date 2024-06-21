*** Settings ***
Documentation    Test cases for login.
Resource         ../resources/login/variable.robot
Resource         ../resources/login/keyword.robot
Library          SeleniumLibrary    implicit_wait=${SLEEP_10S}
Library          Collections
Library          OperatingSystem
Suite Setup      Open Browser       ${LOGIN_URL}    ${BROWSER}
Suite Teardown   Close Browser


*** Test Cases ***
TC-01 Login With Email And Password (With Lightbox and PDPA)
    [Documentation]    Test login with Email and Password (With Lightbox and PDPA)
    [Tags]                            ${TAG_LOGIN}
    # Sleep Time                      ${SLEEP_90S}
    Maximize Browser Window
    Wait Element                      ${XPATH_USERNAME_ELEMENT}
    Close Lightbox                    ${LIGHTBOX_ELEMENT}
    Click Login
    Select IFrame                     ${IFRAME_LOGIN}
    Wait Element                      ${XPATH_USERNAME_ELEMENT} 
    Input Credentials                 ${EMAIL}    ${PASSWORD}
    Click Login Button
    Unselect Frame
    Select IFrame                     ${XPATH_PADPA_MODAL}
    Wait Until Element Is Visible     ${XPATH_PADPA_MODAL}

TC-02 Login With Apple (With Lightbox and PDPA)
    [Documentation]    Test login with Apple (With Lightbox and PDPA)
    [Tags]                            ${TAG_LOGIN}
    Close Lightbox                    ${LIGHTBOX_ELEMENT}
    Click Login
    Select IFrame                     ${IFRAME_LOGIN}
    Wait Element                      ${XPATH_USERNAME_ELEMENT}
    Click Apple Icon
    Switch Window

