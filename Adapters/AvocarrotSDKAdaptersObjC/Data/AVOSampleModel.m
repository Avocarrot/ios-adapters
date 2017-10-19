//
//  AVOSampleModel.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOSampleModel.h"

@interface AVOSampleModel()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *imageUrl;

@end

@implementation AVOSampleModel


- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text imageUrl:(NSString *)imageUrl {
    self = [super init];

    if (self) {
        self.title = title;
        self.text = text;
        self.imageUrl = imageUrl;
    }

    return self;
}

@end
