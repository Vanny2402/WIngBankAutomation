from robot.libraries.BuiltIn import BuiltIn
from lib import PopupPromotionOffer,Excel,Snackbar
from env.settings import env


try:
    BuiltIn().import_resource("${EXECDIR}/src/components/pinCode.robot")
except:
    pass


class Listener(object):
    ROBOT_LISTENER_API_VERSION = 2
    ROBOT_LIBRARY_SCOPE = "GLOBAL"

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self
        self.builtin = BuiltIn()
        self.excel = Excel()
        self.snackbar = Snackbar()
        self.popuppromotionoffer = PopupPromotionOffer()
        self.start_suited = False
        self.testname = ""
        self.is_captured = True
        self.snackbar_detected = False
        self.promotion_offer_detected = False
        self.is_initial_pin_code = True
    
    def start_suite(self, name, attrs):
        self.start_suited = True
        self.builtin.import_library(
            "DataDriver", 
            self.excel.excel_path(
                attrs['longname']
            )
        )


    def start_test(self, name, attrs):
        self.testname = name
        self.is_captured = False
        if not self.start_suited:
            self.builtin.run_keyword("Open Wing Bank App")
        
    def start_keyword(self, name, attrs):
        cust_keyword =  attrs['args'] and attrs['args'][0]
        match cust_keyword :
            case "INPUT_INITIAL_PIN_CODE":
                self.enter_initial_pin()
            case "DETECT_PROMOTION_OFFER":
                self.promotion_offer_detected = True
            case "UNDETECTED_PROMOTION_OFFER":
                self.promotion_offer_detected = False
            case "INPUT_PIN_CODE_CONFIRM_PAYMENT":
                self.builtin.run_keyword("Enter PIN Code")
            case "DETECT_SNACKBAR":
                self.snackbar_detected = True
            case "UNDETECTED_SNACKBAR":
                self.snackbar_detected = False

    def end_keyword(self, name, attrs):
        if attrs['status'] == 'FAIL' and not self.is_captured:
            self.builtin.run_keyword_and_ignore_error(
                "Capture Page Screenshot", 
                f"Failed: {self.testname}.png"
            )
            self.start_suited = False
            self.snackbar_detected = False
            self.is_captured = True
            self.is_initial_pin_code = False

    def log_message(self, message):
        if self.promotion_offer_detected and env['ENVIRONMENT'] != 'PRD':
            self.popuppromotionoffer.popup_promotion_offer_detected()
        if self.snackbar_detected:
            self.snackbar.snackbar_popup_detected(self.testname)

    def end_test(self, name, attrs):
        if attrs['status'] == 'FAIL':
            self.builtin.run_keyword_and_ignore_error("Close Wing Bank App")

    def enter_initial_pin(self):
        if self.is_initial_pin_code:
            self.builtin.run_keyword("Enter PIN Code")
            self.is_initial_pin_code = False
