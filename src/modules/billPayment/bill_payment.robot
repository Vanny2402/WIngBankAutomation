*** Settings ***
Library  AppiumLibrary
Library  ../../utils/helper.py
Library  ../../../lib/number.py
Library  ../../../lib/profile.py

Resource  ../../locators/bill_payment/bill_payment.robot
Resource  ../../components/selectAccount.robot
Resource  ../../components/selectPurposePayment.robot
Resource  ../../components/getRecipientName.robot
Resource  ../../locators/currency_exchange_rate.robot


*** Variables ***
${ToCurrencySellRate}  ${EMPTY}
${ToCurrencyBuyRate}  ${EMPTY}


*** Keywords ***
Promotion Popup Detected
    Log  DETECT_PROMOTION_OFFER


Click Manu Bill Payment
    Wait Until Element Is Visible  ${MENU_BILL_PAYMENT}  60s
    Log  UNDETECTED_PROMOTION_OFFER
    Click Element  ${MENU_BILL_PAYMENT}
    

Select Recipient Bank
    [Arguments]   ${RecipientBank}
    Wait Until Page Contains Element  ${BILLPAY_BUTTON_SEARCH_BILLER}  25s
    Click Element  ${BILLPAY_BUTTON_SEARCH_BILLER}
    Wait Until Page Contains Element  ${BILLPAY_INPUT_SEARCH_BILLER}  25s
    Input Text  ${BILLPAY_INPUT_SEARCH_BILLER}  ${RecipientBank}
    Wait Until Element Is Visible  ${BILLPAY_BILLER_NAME}  25s
    ${BILLER}  Get WebElements  ${BILLPAY_BILLER_NAME}
    FOR  ${Biller}  IN  @{BILLER}
        IF  '${Biller.text}' == '${RecipientBank}'
            Wait Until Element Is Visible  ${BILLPAY_BILLER_NAME}  25s
            Click Element  ${BILLPAY_BILLER_NAME}
            Exit For Loop
        END
    END


Select Sender Wing Account For Transfer
    [Arguments]  ${SenderWingAccount}
    Wait Until Element Is Visible  ${BILLPAY_SELECT_SENDER_ACCOUNT}  25s
    Click Element  ${BILLPAY_SELECT_SENDER_ACCOUNT}
    Click Sender Wing Account For Transfer  ${SenderWingAccount}


Enter Recipien Account For Transfer
    [Arguments]   ${RecipientAccount}
    ${RecipientAccountNumber}  Remove All Non Numberic Char  ${RecipientAccount}
    Wait Until Element Is Visible  ${BILLPAY_RECIPIENT_ACCOUNT}
    Input Text  ${BILLPAY_RECIPIENT_ACCOUNT}  ${RecipientAccountNumber}


Enter Amount For Transfer
    [Arguments]  ${Amount}
    ${BaseAmount}  Convert String To Number  ${Amount}
    Wait Until Element Is Visible  ${BILLPAY_INPUT_AMOUNT}
    Input Text  ${BILLPAY_INPUT_AMOUNT}  ${BaseAmount}
    Wait Until Element Is Visible  ${TO_CURRENTCY_BUY_RATE}  25s
    ${getCurrencyBuyRate}  Get Text  ${TO_CURRENTCY_BUY_RATE}
    ${getCurrencySellRate}  Get Text  ${TO_CURRENTCY_SELL_RATE}
    ${ToCurrencyBuyRate}  Convert String To Number  ${getCurrencyBuyRate}
    ${ToCurrencySellRate}  Convert String To Number  ${getCurrencySellRate}
    Set Global Variable  ${ToCurrencyBuyRate}
    Set Global Variable  ${ToCurrencySellRate}


Confirm Bill Payment
    [Arguments]  ${SenderWingAccount}  ${RecipientAccount}  ${Amount}  ${FeeAmount}
    Wait Until Page Contains Element  ${BILLPAY_CONFIRM_RECEIVER_ACCOUNT_NAME}  25s
    Log  UNDETECTED_SNACKBAR
    ${BaseRecipientAccountNumber}  Remove All Non Numberic Char  ${RecipientAccount}
    ${BaseRecipientName}  Get Recipient Name  ${BaseRecipientAccountNumber}
    Element Text Should Be  ${BILLPAY_CONFIRM_RECEIVER_ACCOUNT_NAME}  ${BaseRecipientName}
    Element Text Should Be  ${BILLPAY_CONFIRM_RECEIVER_ACCOUNT_NUMBER}  ${BaseRecipientAccountNumber}
    ${BaseAmount}  To Currency String  ${Amount}
    ${ReceiverCurrency}  Currency  ${RecipientAccount}
    Element Text Should Be  ${BILLPAY_AMOUNT_TITLE}  Amount:
    Element Text Should Be  ${BILLPAY_AMOUNT}  ${BaseAmount}[${ReceiverCurrency}]
    # ${BaseFeeAmount}  To Currency String  ${FeeAmount}
    # Element Text Should Be  ${BILLPAY_FEE_TITLE}  Fee:
    # Element Text Should Be  ${BILLPAY_FEE}  ${BaseFeeAmount}[${ReceiverCurrency}]
    Element Text Should Be  ${BILLPAY_TOTAL_TITLE}  Total:
    ${SenderCurrency}  Currency  ${SenderWingAccount}
    IF  '${SenderCurrency}' == '${ReceiverCurrency}'
        ${BaseTotalAmount}  Calculate Total Amount  ${Amount}  ${FeeAmount}
        Element Text Should Be  ${BILLPAY_TOTAL}   ${BaseTotalAmount}[${SenderCurrency}]
    ELSE IF  '${SenderCurrency}' == 'usd' and '${ReceiverCurrency}' == 'khr'
        ${CurrencySellRateNumber}  Get Variable Value   ${ToCurrencySellRate}
        ${dollarAmount}  Convert To Dollar  ${Amount}  ${CurrencySellRateNumber}
        ${dollarFeeAmount}  Convert To Dollar  ${FeeAmount}  ${CurrencySellRateNumber}
        ${BaseTotalAmount}  Calculate Total Amount  ${dollarAmount}  ${dollarFeeAmount}
        Element Text Should Be  ${BILLPAY_TOTAL}   ${BaseTotalAmount}[${SenderCurrency}]
    ELSE IF  '${SenderCurrency}' == 'khr' and '${ReceiverCurrency}' == 'usd'
        ${CurrencyBuyRateNumber}  Get Variable Value  ${ToCurrencyBuyRate}
        ${rielAmount}  Convert To Riel  ${Amount}  ${CurrencyBuyRateNumber}
        ${rielFeeAmount}  Convert To Riel  ${FeeAmount}  ${CurrencyBuyRateNumber}
        ${BaseTotalAmount}  Calculate Total Amount  ${rielAmount}  ${rielFeeAmount}
        Element Text Should Be  ${BILLPAY_TOTAL}  ${BaseTotalAmount}[${SenderCurrency}]
    END
    Capture Page Screenshot
    Click Element  ${BUTTON_CONFIRM_BILLPAYMENT}


Verify Bill Payment Should Be Transfer Successful
    Wait Until Page Contains Element  ${BILLPAY_SUCCESS_TITLE}  25s
    Element Text Should Be  ${BILLPAY_SUCCESS_FAVORITE}  Favorite
    Element Text Should Be  ${BILLPAY_SUCCESS_REPEAT}  Repeat
    Element Text Should Be  ${BILLPAY-SUCCESS_SHARE}  Share
    Element Text Should Be  ${BILLPAY_SUCCESS_VIEW_DETAILS}  VIEW DETAILS
    Capture Page Screenshot
    Element Text Should Be  ${BILLPAY_SUCCESS_BTN_DONE}  DONE


Verify Bill Payment Detail
    [Arguments]  ${SenderWingAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${FeeAmount}
    Click Element  ${BILLPAY_SUCCESS_VIEW_DETAILS}
    Wait Until Page Contains Element  ${BILLPAY_VIEW_DETAIL_TITLE}
    Element Text Should Be  ${BILLPAY_SENDER_ACCOUNT_TITLE}  Your Account #:
    ${BaseSenderAccountNumber} =  Remove All Non Numberic Char  ${SenderWingAccount}
    Element Should Be Visible  //*[@text='${BaseSenderAccountNumber}']
    Element Text Should Be  ${BILLPAY_BILLER_TITLE}  Biller:
    Element Should Be Visible  //*[@text='${RecipientBank}']
    Element Text Should Be  ${BILLPAY_RECIPIENT_TITLE}  Account #
    ${BaseRecipientAccountNumber} =  Remove All Non Numberic Char  ${RecipientAccount}
    Element Should Be Visible   //*[@text='${BaseRecipientAccountNumber}']
    Element Text Should Be  ${BILLPAY_TOTAL_TITLE}  Total:
    ${ReceiverCurrency}  Currency  ${RecipientAccount}
    ${SenderCurrency}  Currency  ${SenderWingAccount}
    IF  '${SenderCurrency}' == '${ReceiverCurrency}'
        ${BaseTotalAmount}  Calculate Total Amount  ${Amount}  ${FeeAmount}
        Element Should Be Visible  //*[@text='${BaseTotalAmount}[${SenderCurrency}]']
    ELSE IF  '${SenderCurrency}' == 'usd' and '${ReceiverCurrency}' == 'khr'
        ${CurrencySellRateNumber}  Get Variable Value   ${ToCurrencySellRate}
        ${dollarAmount}  Convert To Dollar  ${Amount}  ${CurrencySellRateNumber}
        ${dollarFeeAmount}  Convert To Dollar  ${FeeAmount}  ${CurrencySellRateNumber}
        ${BaseTotalAmount}  Calculate Total Amount  ${dollarAmount}  ${dollarFeeAmount}
        Element Should Be Visible   //*[@text='${BaseTotalAmount}[${SenderCurrency}]']
    ELSE IF  '${SenderCurrency}' == 'khr' and '${ReceiverCurrency}' == 'usd'
        ${CurrencyBuyRateNumber}  Get Variable Value  ${ToCurrencyBuyRate}
        ${rielAmount}  Convert To Riel  ${Amount}  ${CurrencyBuyRateNumber}
        ${rielFeeAmount}  Convert To Riel  ${FeeAmount}  ${CurrencyBuyRateNumber}
        ${BaseTotalAmount}  Calculate Total Amount  ${rielAmount}  ${rielFeeAmount}
        Element Should Be Visible  //*[@text='${BaseTotalAmount}[${SenderCurrency}]']
    END
    Element Text Should Be  ${BILLPAY_BUTTON_BACK}  BACK
    Element Text Should Be  ${BILLPAY_SUCCESS_BTN_DONE}  DONE
    Capture Page Screenshot   ${TEST_NAME}.png
    Click Element  ${BILLPAY_SUCCESS_BTN_DONE}

    



    


