//
//  ZTKRequestCodeTool.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/4/11.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKRequestCodeTool.h"

@implementation ZTKRequestCodeTool
+(ZTKRequestCodeTool *)instance{
    static ZTKRequestCodeTool *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        obj = [[ZTKRequestCodeTool alloc] init];
    });
    return obj;
}

-(void)handleRequestCode:(NSInteger )code requestToken:(NSString *)token message:(NSString *)message{
    @synchronized(self)  {
        //        if([[self getCurrentVC] isKindOfClass:[ViewController class]]){
        //            return;
        //        }
        NSString *defaultToken = @"";
        NSString *nowToken = defaultToken;
        if(![nowToken isEqualToString:token]){
            return;
        }
        switch (code) {
            case 0:
                [self showAlertViewWithText:message];
                break;
            case 1:
                [self showAlertViewWithText:message];
                break;
                
            default:
                break;
        }
    }
}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        result = nextResponder;
    }else{
        result = window.rootViewController;
    }
    NSLog(@"%@",[result class]);
    return result;
}

-(void)showAlertViewWithText:(NSString *)text{
    
}
@end
