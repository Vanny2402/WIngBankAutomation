*** Settings ***
Documentation  Testing Service Bill Payment on Wing Bank Mobile App
Library  ${EXECDIR}/listener/Listener.py

Resource  ../../modules/common/common.robot
Resource  ../../modules/billPayment/bill_payment.robot
Resource  ../../components/pinCode.robot
Resource  ../../components/actionButton.robot

Suite Setup  Open Wing Bank App
Suite Teardown  Close Wing Bank App
Test Template  VERIFY SERVICE BILL PAYMENT


*** Variables ***
${SenderWingAccount}=  ${EMPTY}
${RecipientBank}=  ${EMPTY}
${RecipientAccount}=  ${EMPTY}
${Amount}=  ${EMPTY}
${WingFee}=  ${EMPTY}


*** Test Cases ***
SERVICE BILL PAYMENT  ${SenderWingAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${WingFee}


*** Keywords ***
VERIFY SERVICE BILL PAYMENT
    [Arguments]  ${SenderWingAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${WingFee}
    Promotion Popup Detected
    Click Manu Bill Payment
    Enter PIN Code
    Select Recipient Bank  ${RecipientBank.strip()}
    Select Sender Wing Account For Transfer  ${SenderWingAccount}
    Enter Recipien Account For Transfer  ${RecipientAccount}
    Enter Amount For Transfer  ${Amount}
    Click Button Pay
    Confirm Bill Payment  ${SenderWingAccount}  ${RecipientAccount}  ${Amount}  ${WingFee}
    Enter PIN Code
    Verify Bill Payment Should Be Transfer Successful
    Verify Bill Payment Detail  ${SenderWingAccount}  ${RecipientBank.strip()}  ${RecipientAccount}  ${Amount}  ${WingFee}