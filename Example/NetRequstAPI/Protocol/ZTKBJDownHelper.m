//
//  ZTKBJDownHelper.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/5/10.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKBJDownHelper.h"
@interface ZTKBJDownHelper()
@property (nonatomic,strong)ZTKDownItem *downItem;
@end

@implementation ZTKBJDownHelper
- (id)initWithDownItem:(ZTKDownItem *)downItem
{
    if (self = [super init]) {
        _downItem = downItem;
    }
    return self;
}


- (void)deleteItem {
    
}

- (void)down {
    NSLog(@"111111111");
}

- (void)resume {
    
}

- (void)stop {
    
}

@end
