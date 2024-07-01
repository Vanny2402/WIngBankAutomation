*** Settings ***
Resource  ../data/data_manager.robot
Resource  ../data/excel_data_path.robot


*** Keywords ***
Get Recipient Name
    [Arguments]  ${RecipientAccountNumber}
    ${GetAllAccount} =  Get Excel Data  ${WING_ACCOUNT_PATH}  WING_ACCOUNT  True
    FOR  ${account}  IN  @{GetAllAccount}
        ${RecipientName}  Set Variable  ${account}[Account Name]
        Return From Keyword If  '${account}[Account Number]' == '${RecipientAccountNumber}'      ${RecipientName.strip()}
    END