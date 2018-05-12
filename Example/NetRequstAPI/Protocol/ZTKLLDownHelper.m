//
//  ZTKLLDownHelper.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/5/10.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKLLDownHelper.h"
@interface ZTKLLDownHelper()
@property (nonatomic,strong)ZTKDownItem *downItem;
@end

@implementation ZTKLLDownHelper
- (id)initWithDownItem:(ZTKDownItem *)downItem{
    if (self = [super init]) {
        _downItem = downItem;
    }
    return self;
    
}
- (void)deleteItem {
    
}

- (void)down {
    NSLog(@"222222");

}

- (void)resume {
    
}

- (void)stop {
    
}



@end
