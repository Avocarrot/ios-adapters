## Contents
* [Mopub](#mopub)
* [1. Setup SDKs](#1-setup-sdks)
* [2. Setup MoPub Dashboard](#2-setup-mopub-dashboard)
* [3. Native Ad Units](#3-native-ad-units)
* [4. Ready to go](#4-ready-to-go)
* [Troubleshooting](#troubleshooting)



## MoPub
You can use **Avocarrot** network in **MoPub** mediation platform.



## 1. Setup SDKs

* Integrate with MoPub SDK [https://github.com/mopub/mopub-ios-sdk/wiki/Getting-Started](https://github.com/mopub/mopub-ios-sdk/wiki/Getting-Started)
* Add [Avocarrot SDK](https://github.com/avocarrot/ios-sdk) to your project
* Include files needed for you into your project.
Files needed for each ad type:

| Ad type | Classes |
|:----------------|:----------------|
| Banners | `AvocarrotMoPubBannerCustomEvent` |
| Interstitial | `AvocarrotMoPubInterstitialCustomEvent` |
| Native | `AvocarrotMoPubNativeCustomEvent`, `AvocarrotMoPubCustomAdapter` |

* Use tutorial how to [integrate custom networks](https://www.mopub.com/resources/docs/mopub-ui-account-setup/ad-network-set-up/)


## 2. Setup MoPub Dashboard for Native

Create an "Avocarrot" network in MoPub dashboard and connect it to your Ad Units.

* In MoPub dashboard select Networks  > Add New network

![_networks](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/first_step.png)

* Then select Custom Native Network

![_add-new-network](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/second_step.png)

* Complete the fields according to the Ad Unit that you want to use

![_setup](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/third_step.png)




## 3) Native Ad Units
For Native Ad Units you need to :

- Fill in the following data in the MoPub dashboard:

**Custom Event Class**

```javascript
AvocarrotMoPubNativeCustomEvent
```

**Custom Event Class Data**

```javascript
{"adUnit":"<AvocarrotAdUnit>"}
```

Get your adUnit from the [Avocarrot dashboard](https://www.avocarrot.com/).

## 4. Ready to go

Congratulations! You have now successfully integrated **Avocarrot** ad network and you should receive your first ad from there.

## Troubleshooting

- Please have in mind, that any time you make a change to the MoPub dashboard, try to fetch an ad a couple of times and then wait a few minutes for MoPub's cache to clear.
- You can also try cloning the example project below to make sure everything is running fine.
- If at any point you need any technical help, please get in touch with [Avocarrot Support](https://docs.ampiri.com/)

## Clone the Example Project
* `git clone https://github.com/avocarrot/ios-adapters.git`
