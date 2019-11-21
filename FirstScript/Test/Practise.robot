*** Settings ***
Library    SeleniumLibrary
Library    String   
Library    Collections
    

*** Variables ***
${count}    5
@{dbws_datapoints}

*** Test Cases ***    
For-Loop-In-Range 
    : FOR    ${INDEX}    IN RANGE    10
    \    Log    ${INDEX} 
    \    ${RANDOM_STRING}=    Generate Random String    ${INDEX}
    \    Log To Console    ${RANDOM_STRING}
    
For-Loop-Elements
    @{ITEMS}    Create List    Star Trek    Star Wars    Perry Rhodan
    :FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log To Console    ${ELEMENT}
    \    ${ELEMENT}    Replace String    ${ELEMENT}    ${SPACE}    ${EMPTY}
    \    Log To Console    ${ELEMENT}
    
For-Loop-Exiting
    @{ITEMS}    Create List    Good Element 1    Break On Me    Good Element 2
    :FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}
    \    Run Keyword If    '${ELEMENT}' == 'Break On Me'   Continue For Loop     #Exit For Loop
    \    Log    Do more actions here ...

Repeat-Action
    Repeat Keyword    2    Log    Repeating this ...
StringsAndLists
    ${SOME_VALUE}=    Set Variable    "Test Value"
    Log To Console    ${SOME_VALUE}
    @{WORDS}=    Split String    ${SOME_VALUE}    
    ${FIRST}=    Get From List    ${WORDS}    1
    Log    ${FIRST}
    
If condition
#     below line check if element present then perform click and if not then ignore it and continue execution
| | Run Keyword And Ignore Error | Click Element   | id=dijit_form_Button_0_label  
    
loop with List
    :FOR    ${i}    IN RANGE    0    ${count}
    \  ${j}   Get Text    ${i}
    \  ${listCount}    Get Length    ${dbws_datapoints}
    \    
    \  Run Keyword If    (${i}>2)     Append To List     ${dbws_datapoints}    ${j}
    \  Run Keyword If    (${i}>2)     Log To Console  ${dbws_datapoints[${listCount}]}
    
List Webelements
    #iN BELOW CODE webelements used and for loop start,exit and if condtion
    Open Browser    http://shop.demoqa.com/    Firefox
    Set Browser Implicit Wait    10
    Maximize Browser Window
    Set Focus To Element    xpath=//*[@id="noo-site"]/div[2]/div[3]/div/div[2]/div/div/div/div[2]/div[2]/div[1]/div/h3/a
     
    #Scroll Element Into View    xpath=//*[@id="noo-site"]/div[2]/div[3]/div/div[2]/div/div/div/div[2]/div[2]/div[1]/div/h3/a       
    ${elements}=    Get WebElements    //*[@id="noo-site"]/div[2]/div[3]/div/div[2]/div/div/div/div[2]/div[2]/div[*]/div/h3/a
    ${Size}=    Get Length    ${elements}
    Log To Console    ${Size}        
    :FOR    ${element}    IN    @{elements}
    \    ${text}=    SeleniumLibrary.Get Text    ${element}
    \    Log To Console   ${text}
    \    Run Keyword If   '${text}' == 'PLAYBOY X MISSGUIDED PLUS SIZE GREY LIPS PRINT FRONT CROPPED T SHIRT'   Click Element      ${element}
    \    Exit For Loop If    '${text}' == 'PLAYBOY X MISSGUIDED PLUS SIZE GREY LIPS PRINT FRONT CROPPED T SHIRT'
            #'${text}' == 'PLAYBOY X MISSGUIDED PLUS SIZE GREY LIPS PRINT FRONT CROPPED T SHIRT' 
    Set Focus To Element     id=pa_color
    Select From List By Label    id=pa_color    Grey 
    Set Focus To Element    id=pa_size
    Select From List By Label     id=pa_size    42
     Set Focus To Element        xpath=//button[@class='single_add_to_cart_button button alt']
    Click Element    xpath=//button[@class='single_add_to_cart_button button alt']    
    Click Element    xpath=//i[@class='icon_bag_alt']
    Set Focus To Element    xpath=//a[contains(@class,'checkout-button button alt wc-forward')]
    Click Element    xpath=//a[contains(@class,'checkout-button button alt wc-forward')]
    Set Focus To Element    id=billing_first_name 
    Input Text    id=billing_first_name       krishna
    Set Focus To Element    id=billing_last_name
    Input Text    id=billing_last_name       valmiki
    Set Focus To Element    id=billing_address_1 
    Input Text    id=billing_address_1       Test
    Set Focus To Element    id=billing_address_2
    Input Text    id=billing_address_2       Test
    Set Focus To Element    id=billing_city
    Input Text    id=billing_city       Mumbai
    Click Element        id=select2-billing_state-container
    Input Text    xpath=//input[@class='select2-search__field']       Maharashtra
     Press Keys    xpath=//input[@class='select2-search__field']    ENTER 
    Sleep    5        
    # Set Focus To Element    id=select2-billing_state-container     #select2-
    # Select From List By Label     id=select2-billing_state-container    Maharashtra
    Set Focus To Element    id=terms
    Select Checkbox    id=terms
    Set Focus To Element    id=billing_postcode
     Input Text    id=billing_postcode       123456
    Set Focus To Element    id=billing_phone
    Input Text    id=billing_phone       123456 
    Set Focus To Element    id=billing_email 
    Input Text    id=billing_email       test@test.com
   Sleep    5  
    Click Element    xpath=//button[@id='place_order']
    
    
    
        
       
    


*** Keywords ***
Get Text
    [Arguments]    ${i}
    ${list}    Create List    aaa    bbb    ccc    ddd    eee
    [Return]    ${list[${i}]}