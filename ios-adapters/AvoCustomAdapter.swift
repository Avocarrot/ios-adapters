import Foundation
import MoPub
import AvocarrotSDK
@objc(AvoCustomAdapter)
open class AvoCustomAdapter: NSObject, MPNativeAdAdapter {
	/**
	 * Provides a dictionary of all publicly accessible assets (such as title and text) for the
	 * native ad.
	 *
	 * When possible, you should place values in the returned dictionary such that they correspond to
	 * the pre-defined keys in the MPNativeAdConstants header file.
	 */
	weak open var delegate: MPNativeAdAdapterDelegate!
	open var properties = [AnyHashable: Any]()

	let ad: AdModel
	let avocarrotCustom: AvocarrotCustom
	public init(avocarrotCustom: AvocarrotCustom, ad: AdModel) {

		self.ad = ad
		self.avocarrotCustom = avocarrotCustom

		properties.addOptional(kAdTitleKey, value: ad.getTitle())
		properties.addOptional(kAdTextKey, value: ad.getDescription())
		properties.addOptional(kAdIconImageKey, value: ad.getIcon())
		properties.addOptional(kAdMainImageKey, value: ad.getImage())
		properties.addOptional(kAdCTATextKey, value: ad.getCTAText())
		properties.addOptional(kAdStarRatingKey, value: ad.getRating())

	}

	/**
	 * The default click-through URL for the ad.
	 *
	 * This may safely be set to nil if your network doesn't expose this value (for example, it may only
	 * provide a method to handle a click, lacking another for retrieving the URL itself).
	 */
	open let defaultActionURL: URL? = nil

	/**
	 * Determines whether MPNativeAd should track clicks
	 *
	 * If not implemented, this will be assumed to return NO, and MPNativeAd will track clicks.
	 * If this returns YES, then MPNativeAd will defer to the MPNativeAdAdapterDelegate callbacks to
	 * track clicks.
	 */
	open func enableThirdPartyClickTracking() -> Bool {
		return true
	}

	/** @name Responding to an Ad Being Attached to a View */

	/**
	 * This method will be called when your ad's content is about to be loaded into a view.
	 *
	 * @param view A view that will contain the ad content.
	 *
	 * You should implement this method if the underlying third-party ad object needs to be informed
	 * of this event.
	 */

	open func willAttach(to view: UIView!) {
		avocarrotCustom.bindView(view, ad: ad)
		avocarrotCustom.registerClickListener(view, ad: ad)

	}
	/*
	 Informs Mopub for the clicked registered
	 */
	open func registerClickToMopub() {
		guard let nativeAdDidClick = delegate.nativeAdDidClick else { print("Delegate does not implement click tracking callback. Clicks likely not being tracked."); return }
		nativeAdDidClick(self)
	}

	/*
	 Informs Mopub for the impression registered
	 */
	open func registerImpressionToMopub() {
		guard let nativeAdWillLogImpression = delegate.nativeAdWillLogImpression else { print("Delegate does not implement click tracking callback. Clicks likely not being tracked."); return }
		nativeAdWillLogImpression(self)
	}

	/*
	 Informs Mopub that the web view is closed
	 */
	open func registerFinishHandlingClickToMopub() {
		delegate.nativeAdDidDismissModal(for: self)
	}

	/*
	 Provides the adchoices view to mopub
	 */
	open func privacyInformationIconView() -> UIView! {
		let adChoicesView = UIImageView()
		if let adChoices = ad.getAdChoices() {
			adChoicesView.loadImage(adChoices.getIconUrl())
			avocarrotCustom.registerAdChoicesListener(adChoicesView, ad: ad)
		}
		return adChoicesView
	}

}
