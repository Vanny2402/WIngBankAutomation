*** Settings ***
Variables  ../../env/settings.py


*** Variables ***
${PURPOSE_TITLE}  ${env}[APP_PACKAGE]:id/tvTitle
#xpath=//android.widget.TextView[@text = 'Purpose']
${PURPOSE_DISPLAY}  xpath=//android.widget.EditText[@text = '${EMPTY}']
${PURPOSE_FAMILY}  xpath=//android.widget.TextView[@text = 'Family Support']
${PURPOSE_LOAN}  xpath=//android.widget.TextView[@text = 'Loan repayment']
${PURPOSE_PAYMENT_FOOD}  xpath=//android.widget.TextView[@text = 'Payment for goods/service']
${PURPOSE_PAYMENT_RENTAL}  xpath=//android.widget.TextView[@text = 'Payment for rental/leasing']
${PURPOSE_OTHER}  xpath=//android.widget.TextView[@text = 'Other']