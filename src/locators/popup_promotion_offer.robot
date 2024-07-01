*** Settings ***
Variables  ../../env/settings.py

*** Variables ***
${BUTTON_CLOSE_POPUP_PROMOTION_OFFER}  //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ImageView
${POPUP_PROMOTION_OFFER_IMAGE}  //*[contains(@resource-id, '${env}[APP_PACKAGE]:id/interstitial_relative_layout')]
# ${POPUP_PROMOTION_OFFER_IMAGE}  //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout
${POPUP_PROMOTION_OFFER_IMAGE_LAYOUT}  //*[contains(@resource-id, '${env}[APP_PACKAGE]:id/inapp_interstitial_image_frame_layout')]