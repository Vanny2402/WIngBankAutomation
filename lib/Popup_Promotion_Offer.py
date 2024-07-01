from robot.libraries.BuiltIn import BuiltIn

class PopupPromotionOffer:
    def __init__(self):
        self.builtin = BuiltIn()
        self.is_promotion_offer = False

    def popup_promotion_offer_detected(self):
        for i in range(5):
            is_promotion_offer_visible = self.builtin.run_keyword_and_return_status(
                'Element Should Be Visible', 
                '${BUTTON_CLOSE_POPUP_PROMOTION_OFFER}'
            )
            if is_promotion_offer_visible and self.is_promotion_offer == False:
                self.builtin.run_keyword(
                    'Click Element', 
                    '${BUTTON_CLOSE_POPUP_PROMOTION_OFFER}'
            )
                self.is_promotion_offer = True
            if is_promotion_offer_visible == False and self.is_promotion_offer == True:
                self.is_promotion_offer = False