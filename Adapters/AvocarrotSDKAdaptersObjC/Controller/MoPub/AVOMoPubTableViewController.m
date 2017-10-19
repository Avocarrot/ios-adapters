//
//  AVOMoPubTableViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOMoPubTableViewController.h"
#import "AVOSampleModel.h"
#import "AVONativeAdCell.h"
#import "AVOSampleTableCell.h"
#import <MoPub/MoPub.h>
#import "AvocarrotSDKAdaptersObjC-Swift.h"

@interface AVOMoPubTableViewController ()

@property (nonatomic, strong) MPTableViewAdPlacer *placer;
@property (nonatomic, strong) NSMutableArray<AVOSampleModel *> *sampleData;

@end

@implementation AVOMoPubTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadSampleData];

    MPStaticNativeAdRendererSettings *staticSettings = [MPStaticNativeAdRendererSettings new];
    staticSettings.renderingViewClass = [AVONativeAdCell class];
    staticSettings.viewSizeHandler = ^CGSize(CGFloat maximumWidth) {
        return CGSizeMake(maximumWidth, 110.0);
    };

    MPNativeAdRendererConfiguration *staticConfiguration = [MPStaticNativeAdRenderer rendererConfigurationWithRendererSettings:staticSettings];
    staticConfiguration.supportedCustomEvents = @[@"AvocarrotMoPubNativeCustomEvent"];

    self.placer = [MPTableViewAdPlacer placerWithTableView:self.tableView viewController:self rendererConfigurations:@[staticConfiguration]];

    [self.placer loadAdsForAdUnitID:@"3e2f8df7104b425a97c03d0153c1fb9d"];
}


- (void)loadSampleData {
    self.sampleData = [NSMutableArray new];
    for (NSUInteger index = 0; index < 10; index++) {
        NSString *title = [NSString stringWithFormat:@"Sample title %lu", (unsigned long)index];
        NSString *text = [NSString stringWithFormat:@"sample description %lu", (unsigned long)index];
        NSString *imageUrl = [NSString stringWithFormat:@"https://lorempixel.com/160/160/people/%lu/", (unsigned long)index];

        AVOSampleModel *model = [[AVOSampleModel alloc] initWithTitle:title
                                                                  text:text
                                                              imageUrl:imageUrl];

        [self.sampleData addObject:model];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sampleData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AVOSampleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AVOSampleTableCell" forIndexPath:indexPath];

    [cell loadWithSampleModel:self.sampleData[indexPath.row]];

    return cell;
}


@end
