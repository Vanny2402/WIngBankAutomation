*** Settings ***
Library  AppiumLibrary
Library  ../utils/helper.py

Resource  ../locators/pin_code.robot
Resource  ../data/data_manager.robot
Resource  ../data/excel_data_path.robot


*** Keywords ***
Enter PIN Code
    Wait Until Element Is Visible  ${ACCOUNT_NUMBER}  60s
    ${getAccountNumber} =  Get Text  ${ACCOUNT_NUMBER}
    ${AccountNumber} =  Remove All Non Numberic Char  ${getAccountNumber}
    ${PIN} =  Get PIN  ${AccountNumber}
    ${pinCode} =  Split Integer Into Digit  ${PIN}
    FOR  ${pin}  IN  @{pinCode}
        IF  ${pin} == 0
            Click Element  ${BTN_PIN_NUMBER_ZERO}
        END
        IF  ${pin} == 1
            Click Element  ${BTN_PIN_NUMBER_ONE}
        END
        IF  ${pin} == 2
            Click Element  ${BTN_PIN_NUMBER_TWO}
        END
        IF  ${pin} == 3
            Click Element  ${BTN_PIN_NUMBER_THREE}
        END
        IF  ${pin} == 4
            Click Element  ${BTN_PIN_NUMBER_FOUR}
        END
        IF  ${pin} == 5
            Click Element  ${BTN_PIN_NUMBER_FIVE}
        END
        IF  ${pin} == 6
            Click Element  ${BTN_PIN_NUMBER_SIX}
        END
        IF  ${pin} == 7
            Click Element  ${BTN_PIN_NUMBER_SEVEN}
        END
        IF  ${pin} == 8
            Click Element  ${BTN_PIN_NUMBER_EIGHT}
        END
        IF  ${pin} == 9
            Click Element  ${BTN_PIN_NUMBER_NINE}
        END
    END


Get PIN
    [Arguments]  ${AccountNumber}
    ${GetAllAccount} =  Get Excel Data  ${WING_ACCOUNT_PATH}  WING_ACCOUNT  True
    FOR  ${account}  IN   @{GetAllAccount}      
        Return From Keyword If  '${account}[Account Number]' == '${AccountNumber}'    ${account}[PIN]
    END
