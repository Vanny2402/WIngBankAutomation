*** Settings ***
Variables  ../../../env/settings.py


*** Variables ***
${MENU_BILL_PAYMENT}  //android.widget.TextView[@text = 'Bill Payment']
${MENU_BILLPAYMENT_TITLE}   ${env}[APP_PACKAGE]:id/toolbarTitle
${BILLPAY_BUTTON_SEARCH_BILLER}   ${env}[APP_PACKAGE]:id/ivSearch
${BILLPAY_INPUT_SEARCH_BILLER}   ${env}[APP_PACKAGE]:id/edSearch
${BILLPAY_BILLER_NAME}  ${env}[APP_PACKAGE]:id/tvBiller
${CATEGORY_FINANCE}  //android.widget.TextView[@text = 'Finance']
${CATEGORY_FINANCE_TITLE}   ${env}[APP_PACKAGE]:id/toolbarTitle
${FINANCE_QR}   ${env}[APP_PACKAGE]:id/qrcode
${BILLPAY_SELECT_SENDER_ACCOUNT}  ${env}[APP_PACKAGE]:id/ivTrailingIcon
${BILLPAY_RECIPIENT_ACCOUNT}  ${env}[APP_PACKAGE]:id/edConsumerCode
${BILLPAY_INPUT_AMOUNT}  xpath=//android.widget.EditText[@text = '0']
${BILLPAY_SELECT_PURPOSE}  xpath=//android.widget.EditText[@text = 'Select']
${BILLPAY_BUTTON_PAY}  ${env}[APP_PACKAGE]:id/sendButtonComposeView
## ===== Conform Bill Payment ====
${BILLPAY_CONFIRM_RECEIVER_ACCOUNT_NAME}   ${env}[APP_PACKAGE]:id/tvReceiverAccountName
${BILLPAY_CONFIRM_RECEIVER_ACCOUNT_NUMBER}   ${env}[APP_PACKAGE]:id/tvReceiverAccountNumber
${BILLPAY_AMOUNT_TITLE}  //android.widget.TextView[@text = 'Amount:']
${BILLPAY_AMOUNT}  ${env}[APP_PACKAGE]:id/tvAmount
${BILLPAY_FEE_TITLE}  //android.widget.TextView[@text = 'Fee:']
${BILLPAY_FEE}  ${env}[APP_PACKAGE]:id/tvFee
${BILLPAY_TOTAL_TITLE}  //android.widget.TextView[@text = 'Total:']
${BILLPAY_TOTAL}   ${env}[APP_PACKAGE]:id/tvTotal
${BUTTON_CONFIRM_BILLPAYMENT}  ${env}[APP_PACKAGE]:id/btnConfirm
## ==== Bill Payment Success Screen =====
${BILLPAY_SUCCESS_TITLE}  ${env}[APP_PACKAGE]:id/tvTitle
${BILLPAY_SUCCESS_FAVORITE}  //android.widget.TextView[@text = 'Favorite']
${BILLPAY_SUCCESS_REPEAT}  //android.widget.TextView[@text = 'Repeat']
${BILLPAY-SUCCESS_SHARE}  //android.widget.TextView[@text = 'Share']
${BILLPAY_SUCCESS_VIEW_DETAILS}   ${env}[APP_PACKAGE]:id/btnViewDetail
${BILLPAY_SUCCESS_BTN_DONE}    ${env}[APP_PACKAGE]:id/btnDone
## ===== Bill Payment Detail Screen =====
${BILLPAY_VIEW_DETAIL_TITLE}   ${env}[APP_PACKAGE]:id/tvTitle
${BILLPAY_DATE_TIME_TITLE}  //android.widget.TextView[@text = 'Date and Time:']
${BILLPAY_SENDER_ACCOUNT_TITLE}  //android.widget.TextView[@text = 'Your Account #:']
${BILLPAY_BILLER_TITLE}  //android.widget.TextView[@text = 'Biller:']
${BILLPAY_RECIPIENT_TITLE}  //android.widget.TextView[@text = 'Account #']
${BILLPAY_AMOUNT_TITLE}  //android.widget.TextView[@text = 'Amount:']
${BILLPAY_FEE_TITLE}  //android.widget.TextView[@text = 'FEE']
${BILLPAY_TOTAL_TITLE}  //android.widget.TextView[@text = 'Total:']
${BILLPAY_TID_TITLE}  //android.widget.TextView[@text = 'TID:']
${BILLPAY_BUTTON_BACK}  ${env}[APP_PACKAGE]:id/btnBack