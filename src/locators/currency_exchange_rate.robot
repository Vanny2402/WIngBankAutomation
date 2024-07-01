*** Settings ***
Variables  ../../env/settings.py


*** Variables ***
${TO_CURRENTCY_SELL_RATE}  ${env}[APP_PACKAGE]:id/to_currency_sell_rate
${TO_CURRENTCY_BUY_RATE}  ${env}[APP_PACKAGE]:id/to_currency_buy_rate