//
//  DVUtil.m
//  DVBands
//
//  Created by Devond on 15/11/14.
//  Copyright © 2015年 Devond. All rights reserved.
//

#import "DVUtil.h"

@implementation DVUtil

inline CGFloat FitFloat(NSArray *plist)
{
    CGFloat f = 0.0f;
    
    if (plist.count) {
        switch (plist.count) {
            case 1:
            {
                f = [[plist firstObject] floatValue];
            }
                break;
            case 2:
            {
                f = [[plist firstObject] floatValue];
                f = iPhone6Plus? [plist[1] floatValue]:f;
            }
                break;
            case 3:
            {
                f = iPhone6 ? [plist[1] floatValue]:[plist[0] floatValue];
                f = iPhone6Plus? [plist[2] floatValue]:f;
            }
                break;
            default:
                break;
        }
    }
    
    return f;
}

inline UIFont *FitFont(CGFloat font)
{
    CGFloat f = font - 1;
    
    if (iPhone6) {
        f = font;
    }
    
    if (iPhone6Plus) {
        f = font + 1;
    }
    
    return [UIFont systemFontOfSize:f];
}

+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}


+(UIImage *)imageRoundedFromImage:(UIImage *)image
                             size:(CGSize)imageSize
                 withCornerRadius:(float)cornerRadius
{
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGRect bounds=(CGRect){CGPointZero,imageSize};
    [[UIBezierPath bezierPathWithRoundedRect:bounds
                                cornerRadius:cornerRadius] addClip];
    [image drawInRect:bounds];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}

+(UIImage *)imageRoundedFromImage:(UIImage *)image
                 withCornerRadius:(float)cornerRadius
{
    CGSize imageSize = image.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGRect bounds=(CGRect){CGPointZero,imageSize};
    [[UIBezierPath bezierPathWithRoundedRect:bounds
                                cornerRadius:cornerRadius] addClip];
    [image drawInRect:bounds];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}

+(UIImage *)imageResizeFromImage:(UIImage *)image
                          toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

+(UIImage *)imageScaleFromImage:(UIImage *)image
                        toScale:(CGFloat)scale
{
    CGSize NewSize = CGSizeMake(image.size.width *scale, image.size.height *scale);
    UIGraphicsBeginImageContextWithOptions(NewSize, NO, 2.0f);
    [image drawInRect:CGRectMake(0, 0, image.size.width * scale, image.size.height * scale)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

+(UIImage *)imageComposeWithInnerImage:(UIImage *)innerImage andOuterImage:(UIImage *)outerImage{
    UIGraphicsBeginImageContextWithOptions(outerImage.size, NO, 2.0f);
    [outerImage drawInRect:CGRectMake(0, 0, outerImage.size.width, outerImage.size.height)];
    [innerImage drawInRect:CGRectMake(FitFloat(@[@11,@11]), FitFloat(@[@11,@11]), innerImage.size.width, innerImage.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+(UIImage*)ImageWithColor:(UIColor *)color AndSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage *)addImageToBaseLocationImageFrom:(UIImage *)image{
    UIImage *outerImage = [UIImage imageNamed:@"loc_locationBg_big"];
    UIImage *innerImage = [self imageRoundedFromImage:image size:CGSizeMake(FitFloat(@[@120,@112]), FitFloat(@[@120,@114])) withCornerRadius:FitFloat(@[@60,@57])];
    UIImage *finishImage = [self imageComposeWithInnerImage:innerImage andOuterImage:outerImage];
    return finishImage;
}

+(UIImage *)imageStretchwithImage:(UIImage *)image topGap:(CGFloat)topGap leftGap:(CGFloat)leftGap
{
    int top = image.size.height *topGap; // 顶端盖高度
    int bottom = top -1 ; // 底端盖高度
    int left = image.size.width*leftGap; // 左端盖宽度
    int right = image.size.width*leftGap-1; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *resultImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return resultImage;
}

#pragma mark - Date

+(NSDate *)realDateFromWorldDate:(NSDate *)worldDate
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:worldDate];
    NSDate *realDate = [worldDate  dateByAddingTimeInterval:interval];
    return realDate;
}

+(NSString *)dateConvertToStringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    return timeStr;
}

+(void)hiddenAnimationWithView:(UIView *)view isHidden:(BOOL)hidden WithDuration:(CGFloat)duration{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = duration;
    [view.layer addAnimation:animation forKey:nil];
    view.hidden = hidden;
}

+(CGSize)textSizeCalculateFrom:(NSString *)text InWidth:(CGFloat)width FontSize:(CGFloat)fontSize
{
    NSDictionary *attrs = @{NSFontAttributeName :FitFont(15)};
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return textSize;
}

+(CGFloat)convertToAngleFromDegree:(CGFloat)degree{
    CGFloat temp = M_PI/180;
    return degree * temp;
}


@end
