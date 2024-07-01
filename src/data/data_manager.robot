*** Settings ***
Documentation  Use this layer to get data from external files
Library  RPA.Excel.Files

*** Keywords ***
Get Excel Data
    [Arguments]  ${FileName}  ${SheetName}  ${Header}=None  ${Start}=None
    Open Workbook  ${FileName}
    ${ExcelData} =  Read Worksheet  ${SheetName}  header=${Header}  start=${Start}
    RETURN   ${ExcelData}