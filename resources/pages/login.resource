*** Settings ***
Documentation       Login Page

Library             Browser


*** Keywords ***
Go To Login Page
    New Page            https://trade-sticker-dev.vercel.app

Submit Credentials
    [Arguments]         ${email}                    ${password}
    Fill Text           css=input[name=email]       ${email}
    Fill Text           input[name=password]        ${password}
    Click               css=button >> text=Entrar

Toast Message Should Be
    [Arguments]         ${expected_message}

    ${locator}
    ...                 Set Variable
    ...                 css=.Toastify__toast-body div >> text= ${expected_message}

    Wait for Elements State     ${locator}      visible     10