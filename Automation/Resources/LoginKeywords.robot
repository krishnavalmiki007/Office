*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/POM_Login.py
Library    BuiltIn 
Library    String     


*** Keywords ***
Open Browser to the Login Page
        [Arguments]    ${SiteUrl}     ${Browser}    ${Delay}
        Open Browser    ${SiteUrl}    ${Browser}
        Maximize Browser Window
        Set Browser Implicit Wait    ${Delay}
        
Enter User Name
    [Arguments]    ${Username}
    Element Should Be Enabled    ${txt_loginUserName}    
    Input Text    ${txt_loginUserName}       ${Username}
    
Enter Password
    [Arguments]   ${Password}
    Element Should Be Enabled    ${txt_loginPassword}
    Input Password    ${txt_loginPassword}    ${Password}  
    
Click Login
    Click Button    ${btn_signIn}  
    
Assert Dashboard Title
    [Arguments]    ${DashboardTitle}
    Title Should Be    ${DashboardTitle}  
   
Click logout
    Click Element   ${sign_outicon}
     
Close Browser
    SeleniumLibrary.Close Browser     