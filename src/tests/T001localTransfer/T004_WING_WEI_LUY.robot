*** Settings ***
Documentation  Testing Service Wing Wei Luy on Wing Bank Mobile App
Library  ${EXECDIR}/listener/Listener.py
Resource  ../../modules/common/common.robot
Resource  ../../modules/localTransfer/wing_wei_luy.robot
Resource  ../../components/pinCode.robot
Resource  ../../components/selectAccount.robot
Resource  ../../components/selectPurposePayment.robot
Resource  ../../components/actionButton.robot

Suite Setup  Open Wing Bank App
Suite Teardown  Close Wing Bank App
Test Template  VERIFY SERVICE WING WEI LUY

*** Variables ***
${SenderWingAccount}=  ${EMPTY}
${RecipientPhoneNumber}=  ${EMPTY}
${Amount}=  ${EMPTY}
${WingFee}=  ${EMPTY}

*** Test Cases ***
SERVICE WING WEI LUY  ${SenderWingAccount}  ${RecipientPhoneNumber}  ${Amount}  ${WingFee}


*** Keywords ***
VERIFY SERVICE WING WEI LUY
    [Arguments]  ${SenderWingAccount}  ${RecipientPhoneNumber}  ${Amount}  ${WingFee}
    Promotion Popup Detected
    Click Manu Local Transfer
    Enter PIN Code
    Click Service Wing Wei Luy
    Select Sender Wing Account For Transfer
    Click Sender Wing Account For Transfer  ${SenderWingAccount}
    Enter Recipient Phone Number For Transfer  ${RecipientPhoneNumber}
    Enter Amount For Wei Luy   ${Amount}
    Select Purpose Option For Transfer
    Click Purpose Payment  Payment for goods/service
    Click Button Send
    Confirm Payment Wing Wei Luy  ${SenderWingAccount}  ${RecipientPhoneNumber}  ${Amount}  ${WingFee}
    Enter PIN Code
    Verify Perform Service Wing Wei Luy Should Be Transfer Successfully
    Verify View Detail Screen Service Wing Wei Luy  ${SenderWingAccount}  ${RecipientPhoneNumber}  ${Amount}  ${WingFee}