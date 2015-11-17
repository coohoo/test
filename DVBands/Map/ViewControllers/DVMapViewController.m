//
//  DVMapViewController.m
//  DVBands
//
//  Created by Devond on 15/11/12.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVMapViewController.h"
#import "DVNetWork.h"
#import "DVDevicesManager.h"

@interface DVMapViewController()

@property (nonatomic, strong)NSMutableArray *deviceArray;

@end

@implementation DVMapViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.deviceArray = [DVDevicesManager defaultManager].devicesArray;
    
}

@end
