*** Settings ***
Variables  ../../env/settings.py

*** Variables ***
${SNACKBAR_TEXT}  //*[contains(@resource-id, '${env}[APP_PACKAGE]:id/snackbar_text')]