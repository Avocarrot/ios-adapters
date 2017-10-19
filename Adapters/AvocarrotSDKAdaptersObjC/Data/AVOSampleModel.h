//
//  AVOSampleModel.h
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVOSampleModel : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *imageUrl;

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text imageUrl:(NSString *)imageUrl;

@end
