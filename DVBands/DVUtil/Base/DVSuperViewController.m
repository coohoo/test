//
//  DVSuperViewController.m
//  DVBands
//
//  Created by Devond on 15/11/12.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVSuperViewController.h"

@implementation DVSuperViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)dealloc{
#ifdef DEBUG
    NSString *str = NSStringFromClass(self.class);
    NSLog(@"*****  [%@] dealloced  *****", str);
#endif
}

@end
