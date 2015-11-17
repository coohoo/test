//
//  DVDevicesManager.h
//  DVBands
//
//  Created by Devond on 15/11/16.
//  Copyright © 2015年 Devond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVDevicesManager : NSObject

+(DVDevicesManager *)defaultManager;


@property (nonatomic, strong)NSMutableArray  *devicesArray;

@end
