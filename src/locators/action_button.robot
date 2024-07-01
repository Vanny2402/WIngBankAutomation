*** Settings ***
Variables  ../../env/settings.py

*** Variables ***
${BTN_SENT}  //android.widget.TextView[@text='SEND']
${BTN_VIEW_DETAILS}  ${env}[APP_PACKAGE]:id/btnViewDetail
# ${BTN_DONE}  ${env}[APP_PACKAGE]:id/btnDone
${BTN_DONE}    //android.widget.TextView[@text="DONE"]
${BTN_PAY}  //android.widget.TextView[@text='PAY']


