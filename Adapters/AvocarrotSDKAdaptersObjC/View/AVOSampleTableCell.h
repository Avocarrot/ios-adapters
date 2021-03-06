//
//  AVOSampleTableCell.h
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVOSampleModel;

@interface AVOSampleTableCell : UITableViewCell

- (void)loadWithSampleModel:(AVOSampleModel *)sampleModel;

@end
