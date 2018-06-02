//
//  ZTKCacheFactory.h
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/6/2.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZTKCacheFactoryProtocol;

@interface ZTKCacheFactory : NSObject

+ (instancetype)sharedInstance;

- (id<ZTKCacheFactoryProtocol>)getPhoneNumberCache:(NSNumber *)phone;

- (void)clearPhoneNumberCache;

- (id<ZTKCacheFactoryProtocol>)getAvatarCache;

- (void)clearAvatarCache;

@end
