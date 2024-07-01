*** Settings ***
Library  AppiumLibrary
Library  ../../utils/helper.py
Library  ../../../lib/number.py
Library  ../../../lib/profile.py

Resource  ../../locators/local_transfer/wing_to_wing.robot
Resource  ../../locators/action_button.robot
Resource  ../../data/data_manager.robot
Resource  ../../data/excel_data_path.robot
Resource  ../../components/getRecipientName.robot
Resource  ../../components/selectAccount.robot


*** Keywords ***
Promotion Popup Detected
    Log To Console  DETECT_PROMOTION_OFFER


Click Manu Local Transfer
    Wait Until Element Is Visible  ${LOCAL_TRANSFER}  60s
    Log  UNDETECTED_PROMOTION_OFFER
    Click Element  ${LOCAL_TRANSFER}


Click Service Wing To Wing
    Wait Until Element Is Visible  ${WING_TO_WING}  60s
    Click Element  ${WING_TO_WING}


Select Sender Wing Account For Transfer
    Wait Until Element Is Visible  ${W2W_SELECT_SENDER_ACCOUNT}
    Click Element  ${W2W_SELECT_SENDER_ACCOUNT}


Enter Receiver Wing Account For Transfer
    [Arguments]  ${RecipientWingAccount}
    ${RecipientWingAccountNumber} =  Remove All Non Numberic Char  ${RecipientWingAccount}
    Wait Until Page Contains Element  ${W2W_TRANSFER_ACCOUNT}
    Clear Text  ${W2W_TRANSFER_ACCOUNT}
    Input Text  ${W2W_TRANSFER_ACCOUNT}  ${RecipientWingAccountNumber}


Enter Amount For Transfer
    [Arguments]  ${Amount}
    ${GetAmount} =  Convert String To Number  ${Amount}
    Wait Until Page Contains Element  ${W2W_INPUT_AMOUNT}
    Clear Text  ${W2W_INPUT_AMOUNT}
    Input Text  ${W2W_INPUT_AMOUNT}  ${GetAmount}


Select Purpose Option For Transfer
    Wait Until Page Contains Element  ${W2W_SELECT_PURPOSE}
    Element Text Should Be  ${W2W_SELECT_PURPOSE}  Select
    Click Element  ${W2W_SELECT_PURPOSE}


Confirm Payment Wing To Wing
    [Arguments]  ${SenderAccount}  ${RecipientWingAccount}  ${Amount}  ${FeeAmount}
    Wait Until Page Contains Element  //*[@text='Transferring to'] 
    ${BaseRecipientWingAccountNumber} =  Remove All Non Numberic Char  ${RecipientWingAccount}
    ${BaseRecipientName} =  Get Recipient Name  ${BaseRecipientWingAccountNumber}
    Element Should Be Visible  //*[@text='Transferring to']    
    Element Should Be Visible  //*[@text='${BaseRecipientName}']
    Element Should Be Visible  //*[@text='${BaseRecipientWingAccountNumber}']
    Element Should Be Visible  //*[@text='From ']
    Element Should Be Visible  //*[@text='Purpose ']
    Element Text Should Be  ${CONFIRM_AMOUNT_TITLE}    Amount
    Element Text Should Be  ${CONFIRM_TOTAL_TITLE}    Total
    ${SenderCurrency} =  currency_s    ${SenderAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    ${SenderAccount}=    Remove All Non Numberic Char    ${SenderAccount}
    Element Text Should Be  ${VALIDATE_FROM_ACCOUNT_VALUE}    ${SenderAccount}
    ${Amount}    Set Variable If    ${Amount} == int(${Amount})    ${Amount}.00    ${Amount}
    Element Text Should Be  ${VALIDATE_AMOUNT_VALUE}    ${SenderCurrency}${Amount}
    Element Text Should Be  ${VALIDATE_PURPOSE_VALUE}    Payment for rental/leasing
    # Element Text Should Be  ${VALIDATE_TOTAL_VALUE}    ${SenderCurrency}${Amount}
    Click Element   ${CONFIRM_BUTTON}

Verify Local Transfer Wing Bank To Wing Bank Should Be Success
    [Arguments]  ${SenderAccount}  ${RecipientWingAccount}  ${Amount}
    ${BaseRecipientWingAccountNumber} =  Remove All Non Numberic Char  ${RecipientWingAccount}
    ${BaseRecipientName} =  Get Recipient Name  ${BaseRecipientWingAccountNumber}
    ${BaseSenderAccountNumber} =    Remove All Non Numberic Char  ${SenderAccount}
    Wait Until Page Contains Element     ${VERIFY_LABEL_SUCCESS}  25s   
    ${SenderCurrency} =  currency_s  ${SenderAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    ${BaseAmount}    Set Variable If    ${Amount} == int(${Amount})    ${Amount}.00    ${Amount} 


    Element Should Be Visible  //*[@text='-${SPACE}${SenderCurrency}${BaseAmount}']
    Element Should Be Visible  //*[@text='Transferred to${SPACE}${BaseRecipientName}']
    Element Should Be Visible  ${DATE_AND_TIME}
    Element Should Be Visible  ${FROM_ACCOUNT}
    Element Should Be Visible  ${TO_ACCOUNT}
    Element Should Be Visible  ${TRANSACTIOIN_ID}
    Element Should Be Visible  ${BTN_FAVOURITE}
    Element Should Be Visible  ${BTN_REPEAT}
    Element Should Be Visible  ${BTN_SHARE}
    Element Should Be Visible  ${BTN_DETAILS}
    Element Should Be Visible     //*[@text='${BaseSenderAccountNumber}'] 
    Element Should Be Visible      //*[@text='${BaseRecipientWingAccountNumber}']
    Capture Page Screenshot   Success_Screen${TEST_NAME}.png


Verify Local Transfer Wing Bank To Wing Bank Detail
    [Arguments]  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${FeeAmount}
    Click Element  ${BTN_DETAILS}
    ${BaseSenderAccountNumber} =   Remove All Non Numberic Char  ${SenderWingAccount}
    ${BaseRecipientWingAccountNumber} =  Remove All Non Numberic Char  ${RecipientWingAccount}
    ${BaseRecipientName} =  Get Recipient Name  ${BaseRecipientWingAccountNumber}
    ${SenderCurrency} =     currency_s   ${SenderWingAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    ${BaseAmount}    Set Variable If    ${Amount} == int(${Amount})    ${Amount}.00    ${Amount}
    ${BaseFeeAmount} =  To Currency String  ${FeeAmount}
    ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}${FeeAmount}

    Element Should Be Visible  //*[@text='Date and Time:']
    Element Should Be Visible  //*[@text='From Account:']
    Element Should Be Visible  //*[@text='${BaseSenderAccountNumber}'] 
    Element Should Be Visible  //*[@text='Recipient Name:']
    Element Should Be Visible  //*[@text='${BaseRecipientName}'] 
    Element Should Be Visible  //*[@text='Recipient Account:']
    Element Should Be Visible  //*[@text='${BaseRecipientWingAccountNumber}']
    Element Should Be Visible  //*[@text='Amount:']
    Element Should Be Visible  //*[@text='-${SPACE}${SenderCurrency}${BaseAmount}']
    Element Should Be Visible  //*[@text='Exchange Rate:']
    Element Should Be Visible  //*[@text='Transaction ID:']
    Element Should Be Visible  //*[@text='Channel:']
    Element Should Be Visible  //*[@text='MOBAPP']
    Element Should Be Visible  //*[@text='Transfer Type:']
    Element Should Be Visible  //*[@text='Wing Bank to Wing Bank']
    Capture Page Screenshot   Details-${TEST_NAME}.png
    Swipe    500    500    500    1000 
    ${RE_WARD_BTN}     Run Keyword And Return Status    Element Should Be Visible    ${BTN_REWARD} 
    ${element_visible}    Run Keyword And Return Status    Element Should Be Visible    ${BTN_DONE}
    Log To Console    REWARD_BTN:${RE_WARD_BTN}
    Log To Console    DONE_BUTTON:${element_visible}
    Run Keyword If    ${element_visible}
    ...    Click Element    ${BTN_DONE}
    ...    ELSE      
    ...    Click Element   ${X_BUTTONO}

    