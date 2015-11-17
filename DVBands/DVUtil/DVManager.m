//
//  DVManager.m
//  DVBands
//
//  Created by Ted on 15/11/15.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVManager.h"

@implementation DVManager

+(BOOL)userHasLogin{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:LoginTokenKey]) {
        return YES;
    }
    return NO;
}

+(BOOL)checkIsFirstLaunch{
    return NO;
}

+(void)showAlertWithString:(NSString *)alertStr duration:(CGFloat)duration{
    UIView *baseView =  [[UIView alloc]init];
    baseView.backgroundColor = [UIColor blackColor];
    baseView.alpha = 0.8;
    baseView.layer.cornerRadius = 5.0f;
    baseView.layer.masksToBounds = YES;
    [UI_WINDOW addSubview:baseView];
    
    CGFloat baseWidth = IPHONE_WIDTH - 100;
    
    UILabel *alertlabel = [[UILabel alloc]init];
    alertlabel.text = alertStr;
    alertlabel.numberOfLines = 0;
    CGFloat textWidth = baseWidth - 20;
    CGFloat textHeight = [alertStr boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:16] forKey:NSFontAttributeName] context:nil].size.height;
    alertlabel.textColor = [UIColor whiteColor];
    alertlabel.textAlignment = NSTextAlignmentCenter;
    alertlabel.backgroundColor = [UIColor clearColor];
    alertlabel.font = [UIFont systemFontOfSize:16];
    [UI_WINDOW addSubview:alertlabel];
    
    if (textHeight < 50) {
        textHeight = 50;
    }
    
    [baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(baseWidth);
        make.centerX.mas_equalTo(UI_WINDOW.mas_centerX);
        make.centerY.mas_equalTo(UI_WINDOW.mas_centerY);
        make.height.mas_equalTo(textHeight * 2);
    }];
    
    [alertlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(textWidth);
        make.centerX.mas_equalTo(UI_WINDOW.mas_centerX);
        make.centerY.mas_equalTo(baseView.mas_centerY);
        make.height.mas_equalTo(textHeight);
    }];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            baseView.alpha = 0;
            alertlabel.alpha = 0;
        } completion:^(BOOL finished) {
            [alertlabel removeFromSuperview];
            [baseView removeFromSuperview];
        }];
    });
    


}

@end
