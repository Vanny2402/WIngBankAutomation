*** Settings ***
Documentation  Testing Service Wing Bank To Other Bank on Wing Bank Mobile App
Library  ${EXECDIR}/listener/Listener.py


# Library d:/WORK/Automation/wingbank-mobile-automate//listener/Listener.py

Resource  ../../modules/common/common.robot
Resource  ../../modules/localTransfer/wingbank_to_otherbank.robot
Resource  ../../components/pinCode.robot
Resource  ../../components/selectPurposePayment.robot
Resource  ../../components/actionButton.robot
Resource  ../../components/selectAccount.robot

Suite Setup  Open Wing Bank App
Suite Teardown  Close Wing Bank App
Test Template  VERIFY SERVICE WING BANK TO OTHER BANK

*** Variables ***
${SenderWingAccount}=  ${EMPTY}
${RecipientBank}=  ${EMPTY}
${RecipientAccount}=  ${EMPTY}
${Amount}=  ${EMPTY}
${WingFee}=  ${EMPTY}


*** Test Cases ***
SERVICE WING BANK TO OTHER BANK  ${SenderWingAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${WingFee}

*** Keywords ***
VERIFY SERVICE WING BANK TO OTHER BANK
    [Arguments]  ${SenderWingAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${WingFee}
    Promotion Popup Detected
    Click Manu Local Transfer
    Enter PIN Code
    Click Service Wing Bank To Other Bank
    Select Recipient Bank  ${RecipientBank.strip()}
    Select Sender Wing Account For Transfer
    Click Sender Wing Account For Transfer  ${SenderWingAccount}
    Enter Receiver Other Bank Account For Transfer  ${RecipientAccount}
    Enter Amount For Transfer  ${Amount}
    Select Purpose Option For Transfer
    Click Purpose Payment  Payment for rental/leasing
    Click Button Send
    Confirm Payment Wing Bank To Other Bank  ${SenderWingAccount}  ${RecipientAccount}  ${Amount}  ${WingFee}
    Enter PIN Code
    Verify Local Transfer Wing Bank To Other Bank Should Be Success  ${SenderWingAccount}  ${RecipientAccount}  ${Amount}  ${WingFee}
    Verify Local Transfer Wing Bank To Other Bank Detail  ${SenderWingAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${WingFee}