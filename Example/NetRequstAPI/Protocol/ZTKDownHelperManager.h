//
//  ZTKDownHelperManager.h
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/5/10.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZTKDownItem.h"
@interface ZTKDownHelperManager : NSObject

- (id) initWithDownItem:(id<HTDownItemProtocol>)downItem;

- (void)down;//下载

- (void)pause;//暂停

- (void)deleteItem;//删除下载

- (void)resume;//再次开启下载
@end
