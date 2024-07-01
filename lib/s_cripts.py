import os
import argparse

class Script:
    def command(self) -> int:  # Added 'self' parameter and return type annotation
        parser = argparse.ArgumentParser()
        parser.add_argument(
            "scriptname",
            help="enter command to start project",
        )
        args = parser.parse_args()
        path = ""
        match args.scriptname:
            case "use-uat":
                path = "cd env && dotenv set ENVIRONMENT UAT"
            case "use-prd":
                path = "cd env && dotenv set ENVIRONMENT PRD"
            case "clean-appium":
                path = "adb uninstall io.appium.uiautomator2.server && adb uninstall io.appium.uiautomator2.server.test && adb uninstall io.appium.settings"
            case "transfer-to-own-account":
                path = "robot -d results/transfer-to-own-account src/tests/T001localTransfer/T001_TRANSFER_TO_OWN_ACCOUNT.robot"
            case "wing-bank-to-wing-bank":
                path = "robot -d results/wing-to-wing src/tests/T001localTransfer/T002_WING_BANK_TO_WING_BANK.robot"
            case "wing-bank-to-other-bank":
                path = "robot -d results/wingbank-to-otherbank src/tests/T001localTransfer/T003_WING_BANK_TO_OTHER_BANK.robot"
            case "wing-wei-luy":
                path = "robot -d results/wing-wei-luy src/tests/T001localTransfer/T004_WING_WEI_LUY.robot"
            case "bill-payment":
                path = "robot -d results/finance-bill-payment src/tests/T003billPayment/T001_BILL_PAYMENT.robot"
            case _: 
                path = "command line not found!"
        return os.system(path)