//
//  ZTKDownHelperManager.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/5/10.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKDownHelperManager.h"
#import "ZTKDownHelperProtocol.h"
#import "ZTKDownItem.h"
#import "ZTKBJDownHelper.h"
#import "ZTKLLDownHelper.h"
@interface ZTKDownHelperManager()

@property (nonatomic,strong) id <ZTKDownHelperProtocol> downHelper;

@end

@implementation ZTKDownHelperManager
- (id)initWithDownItem:(id<HTDownItemProtocol>)downItem
{
    if (self = [super init]) {
        
        ZTKDownItem *tmpItem= [downItem parseToDownItem];
        
        if (tmpItem.itemType == BjyDownItemType) {
            
            _downHelper = [[ZTKBJDownHelper alloc] initWithDownItem:tmpItem];
            
        }else{
            
            _downHelper = [[ZTKLLDownHelper alloc] initWithDownItem:tmpItem];
        }
    }
    return self;
}
- (void)down
{
    [self.downHelper down];
}

- (void)pause
{
    //    [self.downHelper ];
}

- (void)deleteItem
{
    [self.downHelper deleteItem];
}


@end
