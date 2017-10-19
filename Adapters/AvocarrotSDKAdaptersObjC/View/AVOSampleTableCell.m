//
//  AVOSampleTableCell.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOSampleTableCell.h"
#import "AVOSampleModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface AVOSampleTableCell()

@property (nonatomic, weak) IBOutlet UILabel *sampleTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *sampleTextLabel;
@property (nonatomic, weak) IBOutlet UIImageView *sampleImageView;

@end


@implementation AVOSampleTableCell

- (void)loadWithSampleModel:(AVOSampleModel *)sampleModel {
    self.sampleTextLabel.text = sampleModel.text;
    self.sampleTitleLabel.text = sampleModel.title;
    [self.sampleImageView sd_setImageWithURL:[NSURL URLWithString:sampleModel.imageUrl]];
}

@end
