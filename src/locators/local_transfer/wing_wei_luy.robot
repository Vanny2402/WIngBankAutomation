*** Settings ***
Variables  ../../../env/settings.py


*** Variables ***
${LOCAL_TRANSFER}  ${env}[APP_PACKAGE]:id/btn_local_transfer
${BTN_WING_WEI_LUY}  //android.widget.TextView[@text = 'Wing Wei Luy']
${WWL_SELECT_SENDER_ACCOUNT}  ${env}[APP_PACKAGE]:id/ivTrailingIcon
${WWL_RECIPIENT_PHONE_NUMBER}  //android.widget.EditText[@text = '${EMPTY}']
${WWL_INPUT_AMOUNT}  //android.widget.EditText[@text = '0']
${WWL_SELECT_PURPOSE}  //android.widget.EditText[@text = 'Select']
## ===== Conform Screen =====
${WWL_CONFIRM_RECIPIEN_PHONE_NUMBER}  ${env}[APP_PACKAGE]:id/tvReceiverAccountNumber
${WWL_CONFIRM_AMOUNT_TITLE}  //android.widget.TextView[@text = 'Amount:']
${WWL_CONFIRM_PAYMENT_AMOUNT}  ${env}[APP_PACKAGE]:id/tvAmount
${WWL_CONFIRM_FEE_TITLE}  //android.widget.TextView[@text = 'Fee:']
${WWL_CONFIRM_PAYMENT_FEE}  ${env}[APP_PACKAGE]:id/tvFee
${WWL_CONFIRM_TOTAL_TITLE}  //android.widget.TextView[@text = 'Total:']
${WWL_CONFIRM_TOTAL_AMOUNT}  ${env}[APP_PACKAGE]:id/tvTotal
${WWL_CONFIRM_PURPOSE_TITLE}  ${env}[APP_PACKAGE]:id/tvPurpose
${BUTTON_CONFIRM_WWL_PAYMENT}  ${env}[APP_PACKAGE]:id/btnConfirm
## ===== Success Screen =====
${WWL_SUCCESS_TITLE}  ${env}[APP_PACKAGE]:id/tvTitle
${WWL_SUCCESS_VOUCHER_CODE}   ${env}[APP_PACKAGE]:id/tvVoucherCode
${WWL_SUCCESS_FAVORITE_TITLE}  //android.widget.TextView[@text = 'Favorite']
${WWL_SUCCESS_REPEAT_TITLE}   //android.widget.TextView[@text = 'Repeat']
${WWL_SUCCESS_SHARE_TITLE}  //android.widget.TextView[@text = 'Share']
${WWL_BUTTON_VIEW_DETAILS}   ${env}[APP_PACKAGE]:id/btnViewDetail
${WWL_BUTTON_DONE}  ${env}[APP_PACKAGE]:id/btnDone
## ===== Detail Screen =====
${WWL_VIEW_DETAITLS_TITLE}  ${env}[APP_PACKAGE]:id/tvTitle
${WWL_VIEW_DATETIME_TITLE}  //android.widget.TextView[@text = 'Date and Time:']
${WWL_VIEW_SENDER_ACCOUNT_TITLE}  //android.widget.TextView[@text = 'Account #:']
${WWL_VIEW_RECIPIENT_ACCOUNT_TITLE}   //android.widget.TextView[@text = 'Recipient #:']
${WWL_VIEW_CODE_TITLE}  //android.widget.TextView[@text = 'Code:']
${WWL_VIEW_PAYMENT_AMOUNT_TITLE}  //android.widget.TextView[@text = 'Amount:']
${WWL_VIEW_PAYMENT_FEE_TITLE}  //android.widget.TextView[@text = 'Fee:']
${WWL_VIEW_PAYMENT_TOTAL_TITLE}  //android.widget.TextView[@text = 'Total:']
${WWL_VIEW_TXN_TITLE}  //android.widget.TextView[@text = 'TID:']
${WWL_VIEW_PURPOSE_TITLE}  //android.widget.TextView[@text = 'Purpose']



