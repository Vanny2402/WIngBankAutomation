*** Settings ***
Library  AppiumLibrary
Library  ../../../../lib/number.py
Library  ../../../../lib/profile.py
Library  ../../../utils/helper.py


Resource  ../../../locators/local_transfer/transfer_to_own_account.robot

*** Keywords ***
Check Success Amount  
    [Arguments]  ${SenderAccount}  ${Amount}
    ${SenderCurrency} =  Currency  ${SenderAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    Element Should Be Visible  //*[@text='-${SPACE}${BaseAmount}[${SenderCurrency}]']


Check Sender Account on Success Screen
    [Arguments]  ${SenderAccount}
    ${BaseSenderAccountNumber} =   Remove All Non Numberic Char  ${SenderAccount}
    Element Should Be Visible  //*[@text='${BaseSenderAccountNumber}']


Check Receiver Account on Success Screen
    [Arguments]  ${RecipientWingAccount}
    ${BaseRecipientAccountNumber} =   Remove All Non Numberic Char  ${RecipientWingAccount}
    Element Should Be Visible  //*[@text='${BaseRecipientAccountNumber}']