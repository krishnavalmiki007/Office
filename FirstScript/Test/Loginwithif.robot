*** Settings ***
Library    SeleniumLibrary
Variables    ../Variable/Locators.py
Library    BuiltIn 
Library    String     

*** Variables ***
${Username}       KRISHNA18
${Password}       1234
${Browser}        Firefox
${SiteUrl}        https://resourcelinkqa.ngahr.com/QA2/aurora/login/index.html
${DashboardTitle}    ResourceLink
${Delay}         10

*** Test Cases ***
LoginTest
    Open Browser to the Login Page
    Enter User Name
    Enter Password
    Click Login
    sleep    ${Delay}
    Assert Dashboard Title
    Click logout
    [Teardown]    Close Browsers

*** Keywords ***
Open Browser to the Login Page
    
        Open Browser    ${SiteUrl}    ${Browser}
        Maximize Browser Window
        Set Browser Implicit Wait    ${Delay}
        
Enter User Name
     
    Element Should Be Enabled    ${txt_loginUserName}    
    Input Text    ${txt_loginUserName}       ${Username}
    
Enter Password
     
    Element Should Be Enabled    ${txt_loginPassword}
    Input Password    ${txt_loginPassword}    ${Password}  
    
Click Login
    Click Button    ${btn_signIn}
| | Run Keyword And Ignore Error | Click Element   | id=dijit_form_Button_0_label          

    
Assert Dashboard Title
    Title Should Be    ${DashboardTitle}  
   
Click logout
    Click Element   ${sign_outicon}
     
Close Browsers
    SeleniumLibrary.Close Browser     