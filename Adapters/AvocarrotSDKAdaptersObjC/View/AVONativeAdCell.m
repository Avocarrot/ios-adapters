//
//  AVONativeAdCell.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVONativeAdCell.h"
#import <MoPub/MoPub.h>

@interface AVONativeAdCell() <MPNativeAdRendering>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *mainTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *callToActionButton;
@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak) IBOutlet UIView *videoView;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UIImageView *privacyInformationIconImageView;
@property (nonatomic, weak) IBOutlet UIView *containerView;

@end


@implementation AVONativeAdCell


- (UILabel *)nativeMainTextLabel {
    return self.mainTextLabel;
}


- (UILabel *)nativeTitleTextLabel {
    return self.titleLabel;
}


- (UILabel *)nativeCallToActionTextLabel {
    return self.callToActionButton;
}


- (UIImageView *)nativeIconImageView {
    return self.iconImageView;
}


- (UIImageView *)nativeMainImageView {
    return self.mainImageView;
}


- (UIView *)nativeVideoView {
    return self.videoView;
}


- (UIImageView *)nativePrivacyInformationIconImageView {
    return self.privacyInformationIconImageView;
}


+ (UINib *)nibForAd {
    return [UINib nibWithNibName:@"AVONativeAdCell" bundle:nil];
}

@end
