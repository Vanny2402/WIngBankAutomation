*** Settings ***
Documentation  Testing Service Wing To Wing on Wing Bank Mobile App
Library  ${EXECDIR}/listener/Listener.py

Resource  ../../modules/common/common.robot
Resource  ../../modules/localTransfer/wing_to_wing.robot
Resource  ../../components/pinCode.robot
Resource  ../../components/actionButton.robot
Resource  ../../components/selectPurposePayment.robot


Suite Setup  Open Wing Bank App
Suite Teardown  Close Wing Bank App
Test Template  VERIFY WING BANK TO WING BANK WITH MANY ACCOUNT


*** Variables ***
${SenderWingAccount}=    ${EMPTY} 
${RecipientWingAccount}=  ${EMPTY} 
${Amount}=  ${EMPTY}
${WingFee}=  ${EMPTY}
${Test}=    ${EMPTY}

*** Test Cases ***
SERVICE WING TO WINGS  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}     ${Test}

*** Keywords ***
VERIFY WING BANK TO WING BANK WITH MANY ACCOUNT
    [Arguments]  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}    ${Test}
    Promotion Popup Detected
    Click Manu Local Transfer
    Enter PIN Code
    Click Service Wing To Wing
    Select Sender Wing Account For Transfer
    Click Sender Wing Account For Transfer  ${SenderWingAccount}
    Enter Receiver Wing Account For Transfer    ${RecipientWingAccount} 
    Enter Amount For Transfer  ${Amount}
    Select Purpose Option For Transfer
    Click Purpose Payment  Payment for rental/leasing
    Capture Page Screenshot   Confirm_Screen${TEST_NAME}.png
    Click Button Send
    Confirm Payment Wing To Wing  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}     
    Enter PIN Code
    Verify Local Transfer Wing Bank To Wing Bank Should Be Success  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount} 
    Verify Local Transfer Wing Bank To Wing Bank Detail  ${SenderWingAccount}  ${RecipientWingAccount}  ${Amount}  ${WingFee}
