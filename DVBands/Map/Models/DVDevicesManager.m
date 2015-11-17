//
//  DVDevicesManager.m
//  DVBands
//
//  Created by Devond on 15/11/16.
//  Copyright © 2015年 Devond. All rights reserved.
//

#import "DVDevicesManager.h"
#import "DVDeviceModel.h"

@implementation DVDevicesManager

+(DVDevicesManager *)defaultManager
{
    static DVDevicesManager *_defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultManager = [[DVDevicesManager alloc] init];
    });
    return _defaultManager;
}


- (NSMutableArray *)devicesArray{
    if (!_devicesArray) {
        _devicesArray = [NSMutableArray array];
        for (int i = 0; i < 10; i ++) {
            DVDeviceModel *model = [[DVDeviceModel alloc]init];
            model.ownerName = [NSString stringWithFormat:@"people%d",i];
            [_devicesArray addObject:model];
        }
    }
    return _devicesArray;
}

@end
