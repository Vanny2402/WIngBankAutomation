*** Settings ***
Library  AppiumLibrary
Library  ../utils/helper.py


*** Keywords ***
Click Sender Wing Account For Transfer
    [Arguments]  ${SenderAccount}
    ${senderAccountNumber} =  Add Space Before Bracket  ${SenderAccount}
    Log To Console        SENDER ACCOUNT:${senderAccountNumber}
    Wait Until Element Is Visible  //*[@text='${senderAccountNumber}']  25s
    Click Element  //*[@text='${senderAccountNumber}']

Click Receiver Account For Transfer
    [Arguments]  ${ReceiverAccount}
    ${ReceiverAccountNumber} =  Add Space Before Bracket  ${ReceiverAccount}
    Wait Until Element Is Visible  //*[@text='${ReceiverAccountNumber}']  25s
    Click Element  //*[@text='${ReceiverAccountNumber}']