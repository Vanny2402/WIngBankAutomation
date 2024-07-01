*** Settings ***
Variables  ../../../env/settings.py
Library     AppiumLibrary
Library  ${EXECDIR}/listener/Listener.py

*** Variables ***

${LOCAL_TRANSFER}  ${env}[APP_PACKAGE]:id/btn_local_transfer
${WING_TO_WING}  xpath=//android.widget.TextView[@text='Wing Bank to Wing Bank']
${W2W_SELECT_SENDER_ACCOUNT}  ${env}[APP_PACKAGE]:id/ivTrailingIcon
${W2W_TRANSFER_ACCOUNT}  ${env}[APP_PACKAGE]:id/tfAccount
${W2W_INPUT_AMOUNT}  xpath=//android.widget.EditText[@text = '0']
${W2W_SELECT_PURPOSE}  xpath=//android.widget.EditText[@text = 'Select']

## ===== Wing To Wing Confrimscreen =====

${TEXT_TRANSFERINGTO}    //android.widget.TextView[@text="Transferring to"]
${CONFIRM_RECEIVER_NAME}  ${env}[APP_PACKAGE]:id/tvReceiverAccountName
${CONFIRM_MESSAGE}  ${env}[APP_PACKAGE]:id/tvMessage
# ${CONFIRM_RECEIVER_ACCOUNT_NUMBER}  ${env}[APP_PACKAGE]:id/tvReceiverAccountNumber
${CONFIRM_AMOUNT_TITLE}   //android.widget.TextView[@text = 'Amount'] 
${CONFIRM_TOTAL_TITLE}    //android.widget.TextView[@index='10']
${VALIDATE_FROM_ACCOUNT_VALUE}    xpath=//android.widget.TextView[@index='4']
${VALIDATE_PURPOSE_VALUE}    xpath=//android.widget.TextView[@index='6']
${VALIDATE_AMOUNT_VALUE}    xpath=//android.widget.TextView[@index='8']
${VALIDATE_TOTAL_VALUE}    xpath=//android.widget.TextView[@index='11']
${CONFIRM_BUTTON}   //android.widget.TextView[@text = 'CONFIRM']

## ===== Screen payment succeeded ====
## ===== Verify Label on success  screen ====

${VERIFY_LABEL_SUCCESS}    //android.widget.TextView[@text='Success']
${DATE_AND_TIME}    //android.widget.TextView[@text='Date and Time:']
${FROM_ACCOUNT}    //android.widget.TextView[@text='From Account:']
${TO_ACCOUNT}    //android.widget.TextView[@text='To Account:']
${TRANSACTIOIN_ID}    //android.widget.TextView[@text='Transaction ID:']

## ===== Verify text button with for action ====

${BTN_FAVOURITE}    //android.widget.TextView[@text='Favorite']
${BTN_REPEAT}    //android.widget.TextView[@text='Repeat']
${BTN_SHARE}    //android.widget.TextView[@text='Share']
${BTN_DETAILS}    //android.widget.TextView[@text='Details']
${TITLE_DETAIL}    //android.widget.TextView[@text='Transaction Details']

##Get Reward 

${X_BUTTONO}    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.widget.ScrollView/android.view.View[1]
${BTN_REWARD}   //android.widget.TextView[@text='Get Reward']

