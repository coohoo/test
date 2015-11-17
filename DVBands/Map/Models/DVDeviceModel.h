//
//  DVDeviceModel.h
//  DVBands
//
//  Created by Devond on 15/11/16.
//  Copyright © 2015年 Devond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVDeviceModel : NSObject

@property (nonatomic, assign)long           deviceID;

@property (nonatomic, copy)NSString         *ownerName;

@property (nonatomic, copy)NSString         *phoneNumber;

@property (nonatomic, copy)NSString         *location;

@end
