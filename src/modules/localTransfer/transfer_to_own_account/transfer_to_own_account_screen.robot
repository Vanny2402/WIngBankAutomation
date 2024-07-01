*** Settings ***
Library  AppiumLibrary
Library  ../../../utils/helper.py

Resource  ../../../locators/local_transfer/transfer_to_own_account.robot

*** Keywords ***
Click Button Select Sender Wing Account For Transfer
    Wait Until Element Is Visible  ${TRANSFER_TO_OWN_ACCOUNT_SELECT_SENDER_ACCOUNT}
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT_SELECT_SENDER_ACCOUNT}


Click Button Select Receiver Account For Transfer
    Wait Until Element Is Visible  ${TRANSFER_TO_OWN_ACCOUNT_SELECT_RECEIVER_ACCOUNT}
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT_SELECT_RECEIVER_ACCOUNT}


Enter Amount For Transfer
    [Arguments]  ${Amount}
    ${GetAmount} =  Convert String To Number  ${Amount}
    Wait Until Page Contains Element  ${TRANSFER_TO_OWN_ACCOUNT_INPUT_AMOUNT}
    Clear Text  ${TRANSFER_TO_OWN_ACCOUNT_INPUT_AMOUNT}
    Input Text  ${TRANSFER_TO_OWN_ACCOUNT_INPUT_AMOUNT}  ${GetAmount}
    
Click Button Done
    Wait Until Page Contains Element  ${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_BUTTON_DONE}  10s
    Click Element  ${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_BUTTON_DONE}