from os.path import join
from env.settings import BASE_DIR,environ
from src.utils.devices import IS_WIN_DOWS


TRANSFER_TO_OWN_ACCOUNT_EXCEL_PATH = f"src/data/excels/{environ}/local-transfer/TransferToOwnAccount{environ}.xlsx"
WING_BANK_TO_WING_BANK = f"src/data/excels/{environ}/local-transfer/WingBankToWingBank{environ}.xlsx"
WING_BANK_TO_OTHER_BANK_EXCEL_PATH = f"src/data/excels/{environ}/local-transfer/WingBankToOtherBank{environ}.xlsx"
WING_WEI_LUY_EXCEL_PATH = f"src/data/excels/{environ}/local-transfer/WingWeiLuy{environ}.xlsx"
BILL_PAYMENT_EXCEL_PATH = f"src/data/excels/{environ}/bill-payment/BillPayment{environ}.xlsx"

print(WING_BANK_TO_WING_BANK)

class Excel():
    def excel_path(self, file_name):
        exec_path = ""
        if IS_WIN_DOWS:
            path = self._get_excel_file_name(file_name).replace(
                '/',
                '\\'
            )
            exec_path = join(BASE_DIR, path).replace(
                '\\', 
                '\\\\'
            )
        else:
            exec_path = join(
                BASE_DIR, 
                self._get_excel_file_name(
                    file_name
                )
            )
        return exec_path
    
    def _get_excel_file_name(self, file_name):
        path = ""
        match file_name:
            case "T001 TRANSFER TO OWN ACCOUNT":
                path = TRANSFER_TO_OWN_ACCOUNT_EXCEL_PATH
            case "T002 WING BANK TO WING BANK":
                path = WING_BANK_TO_WING_BANK
            case "T003 WING BANK TO OTHER BANK":
                path = WING_BANK_TO_OTHER_BANK_EXCEL_PATH
            case "T004 WING WEI LUY":
                path = WING_WEI_LUY_EXCEL_PATH
            case "T001 BILL PAYMENT":
                path = BILL_PAYMENT_EXCEL_PATH
            case "_":
                path = "excel path not found!"
        return path