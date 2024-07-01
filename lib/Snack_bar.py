from robot.libraries.BuiltIn import BuiltIn
class Snackbar:
    def __init__(self):
        self.builtin = BuiltIn()
        self.is_snackbar_visible = False

    def snackbar_popup_detected(self, name):
        self.builtin.import_resource("${EXECDIR}/src/locators/snackbar_text.robot")
        snackbar_module = self.builtin.run_keyword_and_return_status(
            'Element Should Be Visible', 
            '${SNACKBAR_TEXT}'
        )
        if snackbar_module and self.is_snackbar_visible == False:
            get_snackbar_text = self.builtin.run_keyword(
                "Get Text", 
                "${SNACKBAR_TEXT}"
            )
            self.builtin.run_keyword(
                "Capture Page Screenshot", 
                f"Error: {name} - {get_snackbar_text}.png"
            )
            self.builtin.run_keyword(
                "Log To Console", 
                f"Error: {get_snackbar_text}"
            )
            self.is_snackbar_visible = True
        if snackbar_module == False and self.is_snackbar_visible == True:
            self.is_snackbar_visible = False

            