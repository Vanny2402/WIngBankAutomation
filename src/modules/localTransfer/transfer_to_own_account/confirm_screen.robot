*** Settings ***
Library  AppiumLibrary
Library  ../../../utils/helper.py
Library  ../../../../lib/profile.py
Library  ../../../../lib/number.py

Resource  ../../../locators/local_transfer/transfer_to_own_account.robot

*** Keywords ***
Conirm Receiver Wing Account
    [Arguments]  ${RecipientAccount}
    ${BaseRecipientWingAccountNumber} =  Remove All Non Numberic Char  ${RecipientAccount}
    Element Text Should Be  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_RECEIVER_ACCOUNT}  ${BaseRecipientWingAccountNumber}


Confirm Sender Wing Account
    [Arguments]  ${SenderAccount}
    Element Text Should Be  ${TRANSFER_T0_OWN_ACCOUNT_CONFIRM_SENDER_TITLE}  From${SPACE}
    ${BaseSenderAccountNumber} =   Remove All Non Numberic Char  ${SenderAccount}
    Element Text Should Be  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_SENDER_ACCOUNT}  ${BaseSenderAccountNumber}


Confirm Amount
    [Arguments]  ${SenderAccount}  ${Amount}
    Element Text Should Be  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_AMOUNT_TITTLE}  Amount
    ${SenderCurrency} =  Currency  ${SenderAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    Element Should Be Visible  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_AMOUNT_TITTLE} 
    Element Text Should Be  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_AMOUNT}  ${BaseAmount}[${SenderCurrency}]


Confirm Total Amount
    [Arguments]  ${SenderAccount}  ${Amount}  ${FeeAmount}
    Element Text Should Be  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_TOTAL_TITLE}  Total
    ${SenderCurrency} =  Currency  ${SenderAccount}
    ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}  ${FeeAmount}
    Element Text Should Be  ${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_TOTAL}  ${BaseTotalAmount}[${SenderCurrency}]
