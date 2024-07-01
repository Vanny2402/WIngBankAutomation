*** Settings ***
Variables  ../../../env/settings.py

*** Variables ***
${LOCAL_TRANSFER}  ${env}[APP_PACKAGE]:id/btn_local_transfer
${TRANSFER_TO_OWN_ACCOUNT}  //android.widget.TextView[@text='Transfer to Own Account']
${TRANSFER_TO_OWN_ACCOUNT_SELECT_SENDER_ACCOUNT}  xpath=//android.view.View[2]/android.view.View[1]/android.widget.EditText
${TRANSFER_TO_OWN_ACCOUNT_SELECT_RECEIVER_ACCOUNT}  xpath=//android.view.View[2]/android.view.View[2]/android.widget.EditText
${TRANSFER_TO_OWN_ACCOUNT_INPUT_AMOUNT}  xpath=//android.widget.EditText[@text='${EMPTY}']
${TRANSFER_TO_OWN_ACCOUNT_SELECT_PURPOSE}  xpath=//android.widget.EditText[@text='Select']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_TITLE}  xpath=//android.widget.TextView[@text='Own Account']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_RECEIVER_ACCOUNT}  xpath=//android.widget.TextView[@index='2']
${TRANSFER_T0_OWN_ACCOUNT_CONFIRM_SENDER_TITLE}  xpath=//android.widget.TextView[@index='3']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_SENDER_ACCOUNT}  xpath=//android.widget.TextView[@index='4']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_AMOUNT_TITTLE}  xpath=//android.widget.TextView[@index='5']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_AMOUNT}  xpath=//android.widget.TextView[@index='6']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_TOTAL_TITLE}  xpath=//android.widget.TextView[@index='8']
${TRANSFER_TO_OWN_ACCOUNT_CONFIRM_TOTAL}  xpath=//android.widget.TextView[@index='9']
${TRANSFER_TO_OWN_ACCOUNT_BUTTON_CONFIRM}  //android.widget.TextView[@text='CONFIRM']
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_TIILE}  //android.widget.TextView[@text='Success']
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_AMOUNT}  //android.widget.TextView[@index='2']
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_SENDER_ACCOUNT_TITLE}  xpaht=//android.widget.TextView[@text='From Account:']
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_SENDER_ACCOUNT}  xpaht=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_RECEIVER_ACCOUNT_TITLE}  xpath=//android.widget.TextView[@text='To Account:']
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_RECEIVER_ACCOUNT}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_TRANSACTION_ID_TITLE}  xpath=//android.widget.TextView[@text='Transaction ID:']
${TRANSFER_TO_OWN_ACCOUNT_SUCCESS_TRANSACTION_ID}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_BUTTON_ VIEW_TRANSACTION_DETAIL}  xpath=//android.widget.TextView[@text='Details']
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_TITLE}  xpath=//android.widget.TextView[@text='Transaction Details']
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_AMOUNT}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_SENDER_ACCOUNT_TIILE}  xpath=//android.widget.TextView[@text='From Account:']
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_SENDER}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_REVEIVER_ACCOUNT_TITLE}  xpath=//android.widget.TextView[@text='To Account:']
${TRANSFER_TO_OWN_ACCOUNT_TRNASACTION_DETAILS_RECEIVER_ACCOUNT}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_AMOUNT_TITLE}  xpath=//android.widget.TextView[@text='Amount:']
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_AMOUNT}  xpath=//android.view.View
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_TRANSACTION_ID_TITLE}  xpath=//
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_TRANSACTION_ID}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_CHANNEL_TITLE}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_CHANNEL}  xpath=//android.widget.TextView
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_TRANSFER_TYPE_TITLE}  xpath=//android.widget.TextView[@text='']
${TRANSFER_TO_OWN_ACCOUNT_BUTTON_CLOSE_TRANSACTON_DETAILS_MODULE}  xpath=//android.view.View[@content-desc="Close sheet"]
${TRANSFER_TO_OWN_ACCOUNT_TRANSACTION_DETAILS_BUTTON_DONE}  xpath=//android.widget.TextView[@text='DONE']




