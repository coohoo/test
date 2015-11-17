//
//  DVNetWork.h
//  DVBands
//
//  Created by Devond on 15/11/16.
//  Copyright © 2015年 Devond. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccess)(id response);
typedef void(^RequestFailed)(id error);

@interface DVNetWork : NSObject


@property (nonatomic, assign)NSUInteger                 requestType;



- (void)requestWithParameters:(NSDictionary *)dit success:(RequestSuccess)success Failed:(RequestFailed)failed;

@end
