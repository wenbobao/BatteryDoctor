//
//  MainViewController.m
//  BatteryDoctor
//
//  Created by bob on 17/1/14.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "MainViewController.h"
#import "YDSystemUitil.h"
#import "EEIOKitListener.h"

@interface MainViewController ()
{
    EEIOKitListener *listener;
}

@property (weak, nonatomic) IBOutlet UILabel *currentRemainSocLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentMaxSocLabel;
@property (weak, nonatomic) IBOutlet UILabel *originalSocLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentSocLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentVoltageLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryEnergyLabel;
@property (weak, nonatomic) IBOutlet UILabel *chargeStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *systemVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceIdentificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *jailbreakLabel;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView = [UIView new];
    listener = [EEIOKitListener sharedEEIOKitListener];
    [listener startListener];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(ioKitDataUpdated) name:kEEIOKitListenerNewDataNotification object: nil];
    
    [listener requestDataRefresh];
    
    [self requestData];
}

- (IBAction)refreshInfo:(UIBarButtonItem *)sender {
    [self ioKitDataUpdated];
}

- (void)ioKitDataUpdated {

    NSNumber *currentRemainSoc = [EEIOKitListener sharedEEIOKitListener].chargerDict[@"CurrentCapacity"];
    NSNumber *currentMaxSoc = [EEIOKitListener sharedEEIOKitListener].chargerDict[@"MaxCapacity"];
    
    self.currentRemainSocLabel.text = [NSString stringWithFormat:@"%@ mAh", currentRemainSoc];
    self.currentMaxSocLabel.text = [NSString stringWithFormat:@"%@ mAh", currentMaxSoc];
    self.originalSocLabel.text = [NSString stringWithFormat:@"%li mAh", [YDSystemUitil deviceDefaultSoc]];
    self.percentSocLabel.text = [NSString stringWithFormat:@"%.2f %%", currentMaxSoc.floatValue / [YDSystemUitil deviceDefaultSoc] *100];
    
    BOOL isCharging = [[EEIOKitListener sharedEEIOKitListener].chargerDict[@"IsCharging"] boolValue];
    self.chargeStateLabel.text = isCharging ? @"正在充电中": [currentRemainSoc isEqualToNumber:currentMaxSoc] ? @"已充满" : @"未充电";
}

- (void)requestData {
    
    self.deviceTypeLabel.text = [YDSystemUitil devicePlatformString];
    self.systemVersionLabel.text = [YDSystemUitil currentSystemStringVersion];
    self.deviceIdentificationLabel.text = @"";
    self.jailbreakLabel.text = [YDSystemUitil isJailBreak] ? @"是" : @"否";
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
