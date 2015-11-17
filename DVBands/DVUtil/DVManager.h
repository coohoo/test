//
//  DVManager.h
//  DVBands
//
//  Created by Ted on 15/11/15.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVManager : NSObject

+(BOOL)userHasLogin;

+(BOOL)checkIsFirstLaunch;

+(void)showAlertWithString:(NSString *)alertStr duration:(CGFloat)duration;

@end
