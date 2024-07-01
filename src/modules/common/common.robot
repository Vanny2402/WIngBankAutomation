*** Settings ***
Library  AppiumLibrary
Library  OperatingSystem
Variables  ${EXECDIR}/env/settings.py

*** Keywords ***
Open Wing Bank App 
  Open Application  ${env}[APPIUM_SERVER]
    ...    appium:platformName=Android
    ...    appium:deviceName=emulator-5554
    ...    appium:platformVersion=11
    ...    appium:automationName=uiautomator2
    ...    appium:appPackage=${env}[APP_PACKAGE]
    ...    appium:appActivity=${env}[APP_ACTIVITY]
    ...    appium:autoAcceptAlerts=True
    ...    appium:noReset=true
    ...    appium:newCommandTimeout=20000
    ...    appium:newCommandTimeout=50000
    Log  OPEN WING BANK ALREADY
Close Wing Bank App
    Terminate Application  ${env}[APP_PACKAGE]
    Log  CLOSE APP
