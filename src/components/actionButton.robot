*** Settings***
Library  AppiumLibrary    
Resource  ../locators/action_button.robot

*** Keywords ***
Click Button Send
    Wait Until Page Contains Element  ${BTN_SENT}  25s
    Element Text Should Be  ${BTN_SENT}   SEND
    Click Element  ${BTN_SENT}
    Log  DETECT_SNACKBAR



Click Button Pay
    Wait Until Element Is Visible  ${BTN_PAY}  25s
    Click Element  ${BTN_PAY}
    Log  DETECT_SNACKBAR