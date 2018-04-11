//
//  ZTKRequestCodeTool.h
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/4/11.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTKRequestCodeTool : NSObject
+(ZTKRequestCodeTool *)instance;

-(void)handleRequestCode:(NSInteger )code requestToken:(NSString *)token message:(NSString *)message;
@end
