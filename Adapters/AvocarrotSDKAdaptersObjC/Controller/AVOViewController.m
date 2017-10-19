//
//  AVOViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOViewController.h"

@implementation AVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:240.0/255
                                                                        green: 103.0/255
                                                                         blue: 63.0/255
                                                                        alpha: 1.0];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
