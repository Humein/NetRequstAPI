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

//+ (instancetype)sharedDownVideoManager
//{
//    static dispatch_once_t pred = 0;
//    __strong static id _sharedObject = nil;
//    dispatch_once(&pred, ^{
//        _sharedObject = [[self alloc] init]; // or some other init method
//    });
//    return _sharedObject;
//}


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

}

- (void)deleteItem
{
    [self.downHelper deleteItem];
}


@end
