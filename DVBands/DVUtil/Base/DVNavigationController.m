//
//  DVNavigationController.m
//  DVBands
//
//  Created by Devond on 15/11/13.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVNavigationController.h"

@implementation DVNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    
    //导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:RGBFromHex(0x45d1c4)];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //返回键颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
                                                               [UIColor whiteColor],
                                                           NSFontAttributeName:[UIFont systemFontOfSize:18]
                                                           }];

    
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
                                                               [UIColor grayColor],
                                                           NSFontAttributeName:[UIFont systemFontOfSize:16]
                                                           }
                                                forState:UIControlStateDisabled];

    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:
                                                               [UIColor whiteColor],
                                                           NSFontAttributeName:[UIFont systemFontOfSize:16]
                                                           }
                                                forState:UIControlStateNormal];
    
    //去除底部黑线
    [UINavigationBar appearance].shadowImage = [UIImage new];
    [[UINavigationBar appearance] setBackgroundImage:[DVUtil ImageWithColor:[UIColor clearColor] AndSize:CGSizeMake(IPHONE_WIDTH, 1)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}

@end
