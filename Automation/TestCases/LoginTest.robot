*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginKeywords.robot

*** Variables ***
${Username}       KRISHNA18
${Password}       1234
${Browser}        Firefox
${SiteUrl}        https://resourcelinkqa.ngahr.com/QA2/aurora/login/index.html
${DashboardTitle}    ResourceLink
${Delay}         5s

*** Test Cases ***
LoginTest
    Open Browser to the Login Page    ${SiteUrl}     ${Browser}    ${Delay}
    Enter User Name    ${Username}
    Enter Password    ${Password}
    Click Login
    sleep    ${Delay}
    Assert Dashboard Title    ${DashboardTitle}
    Click logout
    [Teardown]    Close Browser    