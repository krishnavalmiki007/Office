*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn 
    

*** Test Cases ***
MyFirstTest
    
    Log    Hellow google.....
    Open Browser    https://google.com    chrome    alias=BrowserA
    Page Should Contain Element    name=q  
    Input Text    name=q    Robot frame work tutorial
    Press Keys    name=q    ENTER  
    Execute Javascript    window.open()
    Switch Window    locator=NEW
    Go To    https://robocon.io
    Execute Javascript    window.open()
    ${handle}    	Switch Window    locator=NEW
    Go To    https://github.com/robotframework/    
    Open Browser    https://github.com    chrome    alias=BrowserB	
    ${location}    Get Location    
    Switch Window    ${handle}    browser=BrowserA
    Set Browser Implicit Wait    5
    Maximize Browser Window
    Sleep    2    
    Close Browser
    Log    Test Complete    
    