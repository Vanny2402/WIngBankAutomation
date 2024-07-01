*** Settings ***
Library  AppiumLibrary
Resource  ../locators/purpose_optional.robot


*** Keywords ***
Click Purpose Payment
    [Arguments]  ${PurposePayment}
    Wait Until Page Contains Element  ${PURPOSE_TITLE}  25s
    Click Element   //*[@text='${PurposePayment}']