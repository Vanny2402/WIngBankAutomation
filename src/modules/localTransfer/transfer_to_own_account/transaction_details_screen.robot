*** Settings ***
Library  AppiumLibrary
Library  ../../../../lib/number.py
Library  ../../../../lib/profile.py
Library  ../../../utils/helper.py


*** Keywords ***
Check Amount on Transaction Details Screen
    [Arguments]  ${SenderAccount}  ${Amount}
    ${SenderCurrency} =  Currency  ${SenderAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    Element Should Be Visible  //*[@text='-${SPACE}${BaseAmount}[${SenderCurrency}]']


Check Sender Account on Transaction Details Screen
    [Arguments]  ${SenderAccount}
    ${BaseSenderAccountNumber} =   Remove All Non Numberic Char  ${SenderAccount}
    Element Should Be Visible  //*[@text='${BaseSenderAccountNumber}']


Check Receiver Account on Transaction Details Screen
    [Arguments]  ${RecipientWingAccount}
    ${BaseRecipientAccountNumber} =   Remove All Non Numberic Char  ${RecipientWingAccount}
    Element Should Be Visible  //*[@text='${BaseRecipientAccountNumber}']
   