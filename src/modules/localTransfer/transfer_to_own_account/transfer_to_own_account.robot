*** Settings ***
Library  AppiumLibrary
Library  ../../../utils/helper.py


Resource  ./transfer_to_own_account_screen.robot
Resource  ./confirm_screen.robot
Resource  ./success_screen.robot
Resource  ./transaction_details_screen.robot
Resource  ../../../components/selectAccount.robot
Resource  ../../../components/actionButton.robot

*** Keywords ***
Promotion Popup Detected
    Log  DETECT_PROMOTION_OFFER

Input Initail PIN Code
    Log  INPUT_INITAIL_PIN_CODE


Click Manu Local Transfer
    Wait Until Element Is Visible  ${LOCAL_TRANSFER}  60s
    Log  UNDETECTED_PROMOTION_OFFER
    Click Element  ${LOCAL_TRANSFER}
    Log  After Click local transfer

Click Service Wing To Wing
    Wait Until Element Is Visible  ${TRANSFER_TO_OWN_ACCOUNT}  60s
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT}


Select Sender Wing Account
    [Arguments]  ${SenderAccount}
    Click Button Select Sender Wing Account For Transfer
    Click Sender Wing Account For Transfer  ${SenderAccount}


Select Receiver Wing Account
    [Arguments]  ${ReceiverAccount}
    Click Button Select Receiver Account For Transfer
    Click Receiver Account For Transfer   ${ReceiverAccount}


Confirm Payment For Transfer To Own Account
    [Arguments]  ${SenderAccount}  ${RecipientWingAccount}  ${Amount}  ${FeeAmount}
    Wait Until Page Contains Element  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_TITLE}  25s
    Log  UNDETECTED_SNACKBAR
    Conirm Receiver Wing Account  ${RecipientWingAccount}
    Confirm Sender Wing Account   ${SenderAccount}
    Confirm Amount  ${SenderAccount}   ${Amount}
    ${SenderCurrency} =  Currency  ${SenderAccount}
    ${RecipientCurrency} =  Currency  ${RecipientWingAccount} 
    IF  '${SenderCurrency}' != '${RecipientCurrency}'
        Confirm Total Amount  ${SenderAccount}  ${Amount}  ${FeeAmount} 
    END
    Capture Page Screenshot
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT_BUTTON_CONFIRM}


Verify Transfer To Own Account Should Be Success
    [Arguments]  ${SenderAccount}  ${RecipientWingAccount}  ${Amount}
    Wait Until Page Contains Element  ${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_TIILE}  25s
    Capture Page Screenshot
    Check Success Amount  ${SenderAccount}  ${Amount}
    Check Sender Account on Success Screen  ${SenderAccount} 
    Check Receiver Account on Success Screen  ${RecipientWingAccount}


Verify Transfer To Own Account Transaction Details
    [Arguments]  ${SenderAccount}  ${RecipientWingAccount}  ${Amount}
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT_BUTTON_ VIEW_TRANSACTION_DETAIL}
    Wait Until Page Contains Element  ${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_TITLE}  20s 
    Check Amount on Transaction Details Screen  ${SenderAccount}  ${Amount}
    Check Sender Account on Transaction Details Screen  ${SenderAccount}
    Check Receiver Account on Transaction Details Screen  ${RecipientWingAccount} 
    Capture Page Screenshot  ${TEST_NAME}.png
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT_BUTTON_CLOSE_TRANSACTON_DETAILS_MODULE}
    Click Button Done    