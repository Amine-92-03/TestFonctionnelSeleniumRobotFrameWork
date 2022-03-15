*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://petstore.octoperf.com
@{identifiants}    j2ee    j2ee

*** Test Cases ***
hello World
    Log To Console    Hello World

Test navigateur
    Open Browser    https://petstore.octoperf.com    gc

Recherche
    Open Browser    ${url}    gc
    Click Link    Enter the Store
    Input Text    keyword    amazon
    Click Element    searchProducts
    ${product_id}=    Get Text    xpath=//font
    Click Link    ${product_id}
    Click Link    EST-18

Acheteur
    Login
    Click Image    ../images/fish_icon.gif
    Click Link    FI-SW-01
    Click Link    Add to Cart

*** Keywords ***
Login
    Open Browser    ${url}    gc
    Click Link    Enter the Store
    Click Link    Sign In
    Input Text    username    ${identifiants}[0]
    Input Text    password    ${identifiants}[1]
    Click Element    signon
