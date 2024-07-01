*** Settings ***
Library  AppiumLibrary
Library  ../../utils/helper.py
Library  ../../../lib/number.py
Library  ../../../lib/profile.py

Resource  ../../data/data_manager.robot
Resource  ../../data/excel_data_path.robot
Resource  ../../locators/local_transfer/wingbank_to_otherbank.robot
Resource  ../../locators/action_button.robot
Resource  ../../components/getRecipientName.robot
Resource  ../../locators/currency_exchange_rate.robot


*** Variables ***
${ToCurrencySellRate}  ${EMPTY}
${ToCurrencyBuyRate}  ${EMPTY}


*** Keywords ***
Promotion Popup Detected
    Log  DETECT_PROMOTION_OFFER


Click Manu Local Transfer
    Wait Until Element Is Visible  ${LOCAL_TRANSFER}  60s
    Log  UNDETECTED_PROMOTION_OFFER
    Click Element  ${LOCAL_TRANSFER}


Click Service Wing Bank To Other Bank
    Wait Until Element Is Visible  ${WINGBANK_TO_OTHERBANK}  60s
    Click Element  ${WINGBANK_TO_OTHERBANK}


Select Recipient Bank
    [Arguments]  ${RecipientBank}
    Wait Until Element Is Visible  //*[@text='${RecipientBank}']
    Click Element  //*[@text='${RecipientBank}']


Select Sender Wing Account For Transfer
    Wait Until Element Is Visible  ${SELECT_WINGBANK_SENDER_ACCOUNT}
    Click Element  ${SELECT_WINGBANK_SENDER_ACCOUNT}


Enter Receiver Other Bank Account For Transfer
    [Arguments]  ${RecipientAccount}
    ${RecipientAccountNumber} =  Remove All Non Numberic Char  ${RecipientAccount}
    Wait Until Page Contains Element  ${SELECT_OTHERBANK_RECIEVER_ACCOUNT}
    Click Element  ${SELECT_OTHERBANK_RECIEVER_ACCOUNT}
    Input Text  ${SELECT_OTHERBANK_RECIEVER_ACCOUNT}  ${RecipientAccountNumber}
    Press Keycode  66


Enter Amount For Transfer
    [Arguments]  ${Amount}
    ${BaseAmount} =  Convert String To Number  ${Amount}
    Wait Until Page Contains Element  ${SELECT_OTHERBANK_RECIEVER_ACCOUNT_ICON}  60s
    Clear Text  ${WING_TO_OTHERBANK_INPUT_AMOUNT}
    Input Text  ${WING_TO_OTHERBANK_INPUT_AMOUNT}  ${BaseAmount}
    ${getCurrencyBuyRate}  Get Text  ${TO_CURRENTCY_BUY_RATE}
    ${getCurrencySellRate}  Get Text  ${TO_CURRENTCY_SELL_RATE}
    ${ToCurrencyBuyRate}  Convert String To Number  ${getCurrencyBuyRate}
    ${ToCurrencySellRate}  Convert String To Number  ${getCurrencySellRate}
    Set Global Variable  ${ToCurrencyBuyRate}
    Set Global Variable  ${ToCurrencySellRate}
  

Select Purpose Option For Transfer
    Wait Until Page Contains Element  ${WING_TO_OTHERBANK_SELECT_PURPOSE}  25s
    Element Text Should Be  ${WING_TO_OTHERBANK_SELECT_PURPOSE}  Select
    Click Element  ${WING_TO_OTHERBANK_SELECT_PURPOSE}


Confirm Payment Wing Bank To Other Bank
    [Arguments]   ${SenderAccount}  ${RecipientAccount}  ${Amount}  ${FeeAmount}
    Wait Until Element Is Visible  ${CONFIRM_MESSAGE}  25s
    Log  UNDETECTED_SNACKBAR
    ${BaseRecipientAccountNumber} =  Remove All Non Numberic Char  ${RecipientAccount}
    ${BaseReceiverName} =  Get Recipient Name  ${BaseRecipientAccountNumber}
    Element Text Should Be  ${CONFIRM_RECEIVER_NAME}  ${BaseReceiverName}
    Element Text Should Be  ${CONFIRM_RECEIVER_ACCOUNT_NUMBER}  ${BaseRecipientAccountNumber}
    ${BaseAmount} =  To Currency String  ${Amount}
    ${ReceiverCurrency} =  Currency  ${RecipientAccount}
    Element Text Should Be  ${CONFIRM_AMOUNT_TITLE}  Amount:
    Element Text Should Be  ${CONFIRM_PAYMENT_AMOUNT}  ${BaseAmount}[${ReceiverCurrency}]
    ${BaseFeeAmount} =  To Currency String  ${FeeAmount}
    Element Text Should Be  ${CONFIRM_FEE_TITLE}  Fee:
    Element Text Should Be  ${CONFIRM_PAYMENT_FEE}  ${BaseFeeAmount}[${ReceiverCurrency}]
    ${SenderCurrency} =  Currency  ${SenderAccount}
    IF  '${SenderCurrency}' == '${ReceiverCurrency}'
        ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}  ${FeeAmount}
        Element Text Should Be  ${CONFIRM_TOTAL_TITLE}  Total:
        Element Text Should Be  ${CONFIRM_PAYMENT_TOTAL}  ${BaseTotalAmount}[${SenderCurrency}]
    ELSE IF  '${SenderCurrency}' == 'usd' and '${ReceiverCurrency}' == 'khr'
        ${CurrencySellRateNumber}  Get Variable Value   ${ToCurrencySellRate}
        ${dollarAmount}  Convert To Dollar  ${Amount}  ${CurrencySellRateNumber}
        ${dollarFeeAmount}  Convert To Dollar  ${FeeAmount}  ${CurrencySellRateNumber}
        ${BaseTotalAmount}  Calculate Total Amount  ${dollarAmount}  ${dollarFeeAmount}
        Element Text Should Be  ${CONFIRM_TOTAL_TITLE}  Total:
        Element Text Should Be  ${CONFIRM_PAYMENT_TOTAL}  ${BaseTotalAmount}[${SenderCurrency}]
    ELSE IF  '${SenderCurrency}' == 'khr' and '${ReceiverCurrency}' == 'usd'
        ${CurrencyBuyRateNumber}  Get Variable Value  ${ToCurrencyBuyRate}
        ${rielAmount} =  Convert To Riel  ${Amount}  
        ${rielFeeAmount} =  Convert To Riel   ${FeeAmount}
        ${BaseTotalAmount} =  Calculate Total Amount  ${rielAmount}  ${rielFeeAmount}
        Element Text Should Be  ${CONFIRM_TOTAL_TITLE}  Total:
        Element Text Should Be  ${CONFIRM_PAYMENT_TOTAL}  ${BaseTotalAmount}[${SenderCurrency}]
    END
    Capture Page Screenshot
    Click Element  ${CONFIRM_BUTTON}


Verify Local Transfer Wing Bank To Other Bank Should Be Success
    [Arguments]  ${SenderAccount}  ${RecipientAccount}  ${Amount}  ${FeeAmount}
    Wait Until Page Contains Element  ${WINGBANK_TO_OTHERBANK_SUCCEED_IMAGE}  25s
    ${SenderCurrency} =  Currency  ${SenderAccount}
    IF  '${SenderCurrency}' == 'usd'
        ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}  ${FeeAmount}
        Element Text Should Be  ${WINGBNAK_TO_OTHERBANK_SUCCEED_TOTAL_AMOUNT}  ${BaseTotalAmount}[${SenderCurrency}]
    ELSE IF  '${SenderCurrency}' == 'khr'
        ${rielAmount} =  Convert To Riel  ${Amount}
        ${rielFeeAmount} =  Convert To Riel   ${FeeAmount}
        ${BaseTotalAmount} =  Calculate Total Amount  ${rielAmount}  ${rielFeeAmount}
        Element Text Should Be  ${WINGBNAK_TO_OTHERBANK_SUCCEED_TOTAL_AMOUNT}  ${BaseTotalAmount}[${SenderCurrency}]
    END
    ${BaseRecipientAccountNumber} =  Remove All Non Numberic Char  ${RecipientAccount}
    ${BaseRecipientName} =  Get Recipient Name  ${BaseRecipientAccountNumber}
    Element Text Should Be  ${PARTNER_BANK_RECEIVER_ACCOUNT_NAME}  ${BaseRecipientName}
    Wait Until Page Contains Element  ${WINGBANK_TO_OTHERBANK_SUCCEED_SUB_TITLE}
    Element Text Should Be  ${FAVORITE}  Favorite
    Element Text Should Be  ${REPEAT}  Repeat
    Element Text Should Be  ${SHARE}  Share
    Wait Until Page Contains Element  ${BTN_VIEW_DETAILS}
    Element Text Should Be  ${BTN_VIEW_DETAILS}  VIEW DETAILS
    Capture Page Screenshot
    Element Text Should Be  ${BTN_DONE}  DONE


Verify Local Transfer Wing Bank To Other Bank Detail
    [Arguments]  ${SenderAccount}  ${RecipientBank}  ${RecipientAccount}  ${Amount}  ${FeeAmount}
    Click Element  ${BTN_VIEW_DETAILS}
    ${ReceiverCurrency} =  Currency  ${RecipientAccount}
    Wait Until Page Contains Element  ${VIEW_DETAITLS_TITLE}  25s
    Element Text Should Be  ${VIEW_DETAITLS_TITLE}  Transfer Successful
    ${BaseSenderAccountNumber} =  Remove All Non Numberic Char  ${SenderAccount}
    Element Text Should Be  ${VIEW_ACCNOUNT}  From Account:
    Element Should Be Visible   //*[@text='${BaseSenderAccountNumber}']
    ${BaseRecipientAccountNumber} =  Remove All Non Numberic Char  ${RecipientAccount}
    ${BaseRecipientName} =  Get Recipient Name  ${BaseRecipientAccountNumber}
    Element Text Should Be  ${VEIW_RECIPIENT_NAME}  Recipient Name:
    Element Should Be Visible  //*[@text='${BaseRecipientName}']
    Element Text Should Be  ${VIEW_RECIPIEINT_ACCOUNT}  Recipient Account:
    Element Should Be Visible  //*[@text='${BaseRecipientAccountNumber}']

    # ${BaseAmount} =  To Currency String  ${Amount}
    # ${ReceiverCurrency} =  Currency  ${RecipientAccount}
    # Element Text Should Be  ${VIEW_AMOUNT}  Amount:
    # Element Should Be Visible      ${BaseAmount}[${ReceiverCurrency}]

    ${BaseFeeAmount} =  To Currency String  ${FeeAmount}
    Element Text Should Be  ${VIEW_FEE}  Fee:
    Element Should Be Visible  //*[@text='-${SPACE}${BaseFeeAmount}[${ReceiverCurrency}]']
    ${SenderCurrency} =  Currency  ${SenderAccount}
    IF  '${SenderCurrency}' == 'usd'
        ${BaseTotalAmount} =  Calculate Total Amount  ${Amount}  ${FeeAmount}
        Element Text Should Be  ${VIEW_TOTAL}  Total:
        Element Should Be Visible  //*[@text='-${SPACE}${BaseTotalAmount}[${SenderCurrency}]']
    ELSE IF  '${SenderCurrency}' == 'khr'
        ${rielAmount} =  Convert To Riel  ${Amount}
        ${rielFeeAmount} =  Convert To Riel   ${FeeAmount}
        ${BaseTotalAmount} =  Calculate Total Amount  ${rielAmount}  ${rielFeeAmount}
        Element Text Should Be  ${VIEW_TOTAL}  Total:
        Element Should Be Visible  //*[@text='-${SPACE}${BaseTotalAmount}[${SenderCurrency}]']
    END
    Wait Until Page Contains Element  ${VIEW_BUTTON_BACK}
    Element Text Should Be  ${VIEW_BUTTON_BACK}  BACK
    Element Text Should Be  ${BTN_DONE}  DONE
    Capture Page Screenshot   ${TEST_NAME}.png
    Click Element   ${BTN_DONE}