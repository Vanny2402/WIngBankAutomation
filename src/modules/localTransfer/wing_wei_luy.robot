*** Settings ***
Library  AppiumLibrary
Library  ../../utils/helper.py
Library  ../../../lib/number.py
Library  ../../../lib/profile.py

Resource  ../../locators/local_transfer/wing_wei_luy.robot


*** Keywords ***
Promotion Popup Detected
    Log  DETECT_PROMOTION_OFFER


Click Manu Local Transfer
    Wait Until Element Is Visible  ${LOCAL_TRANSFER}  60s
    Log  UNDETECTED_PROMOTION_OFFER
    Click Element  ${LOCAL_TRANSFER}


Click Service Wing Wei Luy
    Wait Until Element Is Visible  ${BTN_WING_WEI_LUY}  25s
    Click Element  ${BTN_WING_WEI_LUY}


Select Sender Wing Account For Transfer
    Wait Until Element Is Visible  ${WWL_SELECT_SENDER_ACCOUNT}
    Click Element  ${WWL_SELECT_SENDER_ACCOUNT}


Enter Recipient Phone Number For Transfer
    [Arguments]  ${RecipientPhone}
    ${RecipientPhoneNumber} =  Remove All Non Numberic Char  ${RecipientPhone}
    Wait Until Page Contains Element  ${WWL_RECIPIENT_PHONE_NUMBER}
    Clear Text  ${WWL_RECIPIENT_PHONE_NUMBER}
    Input Text  ${WWL_RECIPIENT_PHONE_NUMBER}  ${RecipientPhoneNumber}


Enter Amount For Wei Luy
    [Arguments]  ${Amount}
    ${BaseAmount} =  Convert String To Number  ${Amount}
    Wait Until Page Contains Element  ${WWL_INPUT_AMOUNT} 
    Clear Text  ${WWL_INPUT_AMOUNT} 
    Input Text  ${WWL_INPUT_AMOUNT}  ${BaseAmount}


Select Purpose Option For Transfer
    Wait Until Element Is Visible  ${WWL_SELECT_PURPOSE}
    Click Element  ${WWL_SELECT_PURPOSE}


Confirm Payment Wing Wei Luy
    [Arguments]  ${SenderWingAccount}  ${RecipientPhone}  ${Amount}  ${Fee}
    Wait Until Page Contains Element  ${WWL_CONFIRM_RECIPIEN_PHONE_NUMBER}  25s
    Log  UNDETECTED_SNACKBAR
    ${RecipientPhoneNumber}  Remove All Non Numberic Char  ${RecipientPhone}
    Element Text Should Be  ${WWL_CONFIRM_RECIPIEN_PHONE_NUMBER}  ${RecipientPhoneNumber} 
    ${SenderCurrency} =  Currency  ${SenderWingAccount}
    ${BaseAmount} =  To Currency String  ${Amount}
    Element Text Should Be  ${WWL_CONFIRM_PAYMENT_AMOUNT}  ${BaseAmount}[${SenderCurrency}]
    ${BaseFee} =  To Currency String  ${Fee}
    Element Text Should Be  ${WWL_CONFIRM_PAYMENT_FEE}  ${BaseFee}[${SenderCurrency}]
    ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}  ${Fee}
    Element Text Should Be  ${WWL_CONFIRM_TOTAL_AMOUNT}    ${BaseTotalAmount}[${SenderCurrency}]
    Capture Page Screenshot
    Click Element  ${BUTTON_CONFIRM_WWL_PAYMENT}


# Verify Perform Service Wing Wei Luy Should Be Transfer Successfully
#     Wait Until Page Contains Element  ${WWL_SUCCESS_TITLE}  25s
#     Element Text Should Be  ${WWL_SUCCESS_TITLE}  Transfer Successful
#     Element Text Should Be  ${WWL_SUCCESS_FAVORITE_TITLE}  Favorite
#     Element Text Should Be  ${WWL_SUCCESS_REPEAT_TITLE}  Repeat
#     Element Text Should Be  ${WWL_SUCCESS_SHARE_TITLE}  Share
#     Element Text Should Be  ${WWL_BUTTON_VIEW_DETAILS}  VIEW DETAILS
#     Capture Page Screenshot
#     Element Text Should Be  ${WWL_BUTTON_DONE}  DONE


# Verify View Detail Screen Service Wing Wei Luy
#     [Arguments]   ${SenderWingAccount}  ${RecipientPhone}  ${Amount}  ${Fee}
#     Click Element  ${WWL_BUTTON_VIEW_DETAILS}
#     Wait Until Page Contains Element   ${WWL_VIEW_DETAITLS_TITLE}  25s
#     ${SenderWingAccountNumber} =  Remove All Non Numberic Char  ${SenderWingAccount}
#     Element Should Be Visible  //*[@text='${SenderWingAccountNumber}']
#     ${RecipientPhoneNumber} =  Remove All Non Numberic Char  ${RecipientPhone}
#     Element Should Be Visible  //*[@text='${RecipientPhoneNumber}']
#     ${SenderCurrency} =  Currency  ${SenderWingAccount}
#     ${BaseAmount} =  To Currency String  ${Amount}
#     Element Should Be Visible  //*[@text='${BaseAmount}[${SenderCurrency}]']
#     ${BaseFee} =  To Currency String  ${Fee}
#     Element Should Be Visible  //*[@text='${BaseFee}[${SenderCurrency}]']
#     ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}  ${Fee} 
#     Element Should Be Visible  //*[@text='${BaseTotalAmount}[${SenderCurrency}]']
#     Capture Page Screenshot  ${TEST_NAME}.png
#     Click Element  ${WWL_BUTTON_DONE}