*** Settings ***
Variables  ../../../env/settings.py

*** Variables ***
${LOCAL_TRANSFER}  ${env}[APP_PACKAGE]:id/btn_local_transfer
${WINGBANK_TO_OTHERBANK}  xpath=//android.widget.TextView[@text='Wing Bank to Other Bank']
${SELECT_WINGBANK_SENDER_ACCOUNT}  ${env}[APP_PACKAGE]:id/ivTrailingIcon
${SELECT_OTHERBANK_RECIEVER_ACCOUNT}  xpath=//android.widget.EditText[@text='${EMPTY}']
${SELECT_OTHERBANK_RECIEVER_ACCOUNT_ICON}  ${env}[APP_PACKAGE]:id/ivLeadingIcon
${WING_TO_OTHERBANK_INPUT_AMOUNT}  xpath=//android.widget.EditText[@text = '0']
${WING_TO_OTHERBANK_SELECT_PURPOSE}  xpath=//android.widget.EditText[@text = 'Select']
## ===== Wing Bank To Other Bank Conform Screen =====
${CONFIRM_MESSAGE}  ${env}[APP_PACKAGE]:id/tvMessage
${CONFIRM_RECEIVER_NAME}  ${env}[APP_PACKAGE]:id/tvReceiverAccountName
${CONFIRM_RECEIVER_ACCOUNT_NUMBER}  ${env}[APP_PACKAGE]:id/tvReceiverAccountNumber
${CONFIRM_AMOUNT_TITLE}   //android.widget.TextView[@text = 'Amount:'] 
${CONFIRM_PAYMENT_AMOUNT}  ${env}[APP_PACKAGE]:id/tvAmount
${CONFIRM_PAYMENT_CONVERTED_AMOUNT}  ${env}[APP_PACKAGE]:id/tvConvertedAmount
${CONFIRM_FEE_TITLE}  ${env}[APP_PACKAGE]:id/lbFee
${CONFIRM_PAYMENT_FEE}  ${env}[APP_PACKAGE]:id/tvFee
${CONFIRM_TOTAL_TITLE}   //android.widget.TextView[@text = 'Total:']
${CONFIRM_PAYMENT_TOTAL}  ${env}[APP_PACKAGE]:id/tvTotal
${CONFIRM_PAYMENT_PURPOSE}  ${env}[APP_PACKAGE]:id/tvPurpose
${CONFIRM_BUTTON}  ${env}[APP_PACKAGE]:id/btnConfirm
# ===== Screen payment succeeded =====
${WINGBANK_TO_OTHERBANK_SUCCEED_IMAGE}  ${env}[APP_PACKAGE]:id/ivHeader
${WINGBNAK_TO_OTHERBANK_SUCCEED_TOTAL_AMOUNT}  ${env}[APP_PACKAGE]:id/tvTotal
${PARTNER_BANK_RECEIVER_ACCOUNT_NAME}  ${env}[APP_PACKAGE]:id/tvMerchantName
${WINGBANK_TO_OTHERBANK_SUCCEED_SUB_TITLE}  ${env}[APP_PACKAGE]:id/tvMessage
${FAVORITE}  xpath=//android.widget.TextView[@text = 'Favorite']
${REPEAT}  xpath=//android.widget.TextView[@text = 'Repeat']
${SHARE}  xpath=//android.widget.TextView[@text = 'Share']
## ===== Screen view detail local transfer wing bank to wing bank =====
${VIEW_DETAITLS_TITLE}  ${env}[APP_PACKAGE]:id/tvTitle
#xpath=//android.widget.TextView[@text = 'Transfer Successful!']
${VIEW_ACCNOUNT}  xpath=//android.widget.TextView[@text = 'From Account:']
${VEIW_RECIPIENT_NAME}  xpath=//android.widget.TextView[@text = 'Recipient Name:']
${VIEW_RECIPIEINT_ACCOUNT}  xpath=//android.widget.TextView[@text = 'Recipient Account:']
${VIEW_AMOUNT}  xpath=//android.widget.TextView[@text = 'Amount:']
${VIEW_FEE}      xpath=//android.widget.TextView[@text = 'Fee:']
${VIEW_TOTAL}  xpath=//android.widget.TextView[@text = 'Total:']
${VIEW_BUTTON_BACK}  ${env}[APP_PACKAGE]:id/btnBack
${TRANSFER_TYPE}  xpath=//android.widget.TextView[@text = 'Transfer Type:']
${PURPOSE}  xpath=//android.widget.TextView[@text = 'Purpose:']