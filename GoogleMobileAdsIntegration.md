## Contents
* [GoogleMobileAds](#googlemobileads)
* [1. Setup SDKs](#1-setup-sdks)
* [Troubleshooting](#troubleshooting)



## GoogleMobileAds
You can use **Avocarrot** network in **GoogleMobileAds** mediation platform for banners, interstitials and native ad types.



## 1. Setup SDKs

* Integrate with GoogleMobileAds SDK [https://github.com/googleads/googleads-mobile-ios-examples](https://github.com/googleads/googleads-mobile-ios-examples)
* Add [Avocarrot SDK](https://github.com/avocarrot/avocarrot-ios-sdk) to your project
* Include files needed for you into your project.

Files needed for each ad type:

| Ad type | Classes |
|:----------------|:----------------|
| Banners | `AvocarrotAdMobCustomEventBanner` |
| Interstitial | `AvocarrotAdMobCustomEventInterstitial` |
| Native | `AvocarrotAdMobMediatedNativeContentAd`, `AvocarrotAdMobCustomEventNativeAd` |

* Use tutorial how to [integrate native custom event](https://developers.google.com/admob/ios/native-custom-events) or [video tutorial](https://www.youtube.com/watch?v=sFew8Squ4pE)
* Use tutorial how to [integrate banners and interstitials](https://developers.google.com/admob/ios/custom-events)

## Troubleshooting

- Please have in mind, that any time you make a change to the GoogleMobileAds dashboard, try to fetch an ad a couple of times and then wait a few minutes for GoogleMobileAds's cache to clear.
- You can also try cloning the example project below to make sure everything is running fine.
- If at any point you need any technical help, please get in touch with [Avocarrot Support](https://docs.ampiri.com/)

## Clone the Example Project
* `git clone https://github.com/avocarrot/avocarrot-ios-adapters.git`
