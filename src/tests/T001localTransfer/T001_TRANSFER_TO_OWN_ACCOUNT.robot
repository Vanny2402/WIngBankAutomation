*** Settings ***
Documentation  Testing Service Transfer to Ownaccount on Wing Bank Mobile App
# Library  ${EXECDIR}/listener/Listener.py
Library  ${EXECDIR}/listener/Listener.py

Resource  ../../modules/common/common.robot
Resource  ../../modules/localTransfer/transfer_to_own_account/transfer_to_own_account.robot

Suite Setup  Open Wing Bank App
Suite Teardown  Close Wing Bank App
Test Template  VERIFY TRANSFER TO OWNACCOUNT


*** Variables ***
${SenderWingAccount}=  ${EMPTY}
${RecipientWingAccount}=  ${EMPTY} 
${Amount}=  ${EMPTY}
${WingFee}=  ${EMPTY}


*** Test Cases ***

SERVICE TRANSFER TO OWNACCOUNTS  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}


*** Keywords ***
VERIFY TRANSFER TO OWNACCOUNT
    [Arguments]  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}
    Promotion Popup Detected
    Log  After promotion
    Click Manu Local Transfer
    Input Initail PIN Code
    Click Service Wing To Wing
    Select Sender Wing Account   ${SenderWingAccount}
    Select Receiver Wing Account  ${RecipientWingAccount}
    Enter Amount For Transfer  ${Amount}
    Click Button Send
    Confirm Payment For Transfer To Own Account  
    ...    ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}
    Verify Transfer To Own Account Should Be Success  ${SenderWingAccount}   ${RecipientWingAccount}  ${Amount}
    Verify Transfer To Own Account Transaction Details  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}