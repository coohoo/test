//
//  DVTabBarController.m
//  DVBands
//
//  Created by Devond on 15/11/12.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVTabBarController.h"
#import "DVMapViewController.h"
#import "DVContactsViewController.h"
#import "DVMessagesViewController.h"
#import "DVNavigationController.h"

@implementation DVTabBarController

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];

    DVMapViewController *mapViewController = [[DVMapViewController alloc]init];
    mapViewController.title = @"Map";
    DVNavigationController *mapNav = [[DVNavigationController alloc]initWithRootViewController:mapViewController];
    
    DVContactsViewController *contactsViewController = [[DVContactsViewController alloc]init];
    contactsViewController.title = @"Contacts";
    DVNavigationController *contactsNav = [[DVNavigationController alloc]initWithRootViewController:contactsViewController];
    
    DVMessagesViewController *messageViewContrller = [[DVMessagesViewController alloc]init];
    messageViewContrller.title = @"Messages";
    DVNavigationController *messagesNav = [[DVNavigationController alloc]initWithRootViewController:messageViewContrller];
    
    self.viewControllers = @[mapNav,contactsNav,messagesNav];
    
    self.tabBar.tintColor = RGBFromHex(0x45d1c4);
    
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *tabBarItem, NSUInteger idx, BOOL *stop) {
        
        switch (idx) {
            case 0:
            {
                [tabBarItem setImage:[[UIImage imageNamed:@"tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                [tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            }
            case 1:
            {
                [tabBarItem setImage:[[UIImage imageNamed:@"tab_contacts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                [tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_contacts_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            }
            case 2:
            {
                [tabBarItem setImage:[[UIImage imageNamed:@"tab_messages"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                [tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_messages_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            }
            default:
                break;
        }
        
    }];
}

@end
