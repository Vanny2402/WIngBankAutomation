*** Settings ***
Variables  ../../env/settings.py

*** Variables ***
${WING_ACCOUNT_PATH}  ${CURDIR}/excels/${env}[ENVIRONMENT]/wing-account/WingAccount${env}[ENVIRONMENT].xlsx
${TRANSFER_TO_OWN_ACCOUNT_EXCEL_PATH}  ${CURDIR}/excels/${env['ENVIRONMENT']}/local-transfer/TransferToOwnAccount${env['ENVIRONMENT']}.xlsx
${WING_BANK_TO_WING_BANK_PATH}  ${CURDIR}/excels/${env['ENVIRONMENT']}/local-transfer/WingBankToWingBank${env['ENVIRONMENT']}.xlsx
${WING_BANK_TO_OTHER_BANK_EXCEL_PATH}  ${CURDIR}/excels/${env['ENVIRONMENT']}/local-transfer/WingBankToOtherBank${env['ENVIRONMENT']}.xlsx
${WING_WEI_LUY_EXCEL_PATH}  ${CURDIR}/excels/${env['ENVIRONMENT']}/local-transfer/WingWeiLuy${env['ENVIRONMENT']}.xlsx
${BILL_PAYMENT_EXCEL_PATH}  ${CURDIR}/excels/${env['ENVIRONMENT']}/bill-payment/BillPayment${env['ENVIRONMENT']}.xlsx
