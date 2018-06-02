//
//  ZTKCacheFactory.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/6/2.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKCacheFactory.h"
#import "ZTKCacheFactoryProtocol.h"

static NSMutableDictionary *gPhoneCache = nil;


@implementation ZTKCacheFactory

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

-(id<ZTKCacheFactoryProtocol>)getAvatarCache{
    
}

-(id<ZTKCacheFactoryProtocol>)getPhoneNumberCache:(NSNumber *)phone{
    
    return [self getFormmatedPhoneNumber:phone];

}

-(void)clearAvatarCache{
    
}

- (void)clearPhoneNumberCache{
    
}

- (id)getFormmatedPhoneNumber:(NSNumber*)phone
{
    if(phone == nil)
    {
        return nil;
    }
    
    NSString* phoneNumberStr = nil;
    
//    [_phoneLock lock];
    if(gPhoneCache == nil)
    {
        gPhoneCache = @{}.mutableCopy;
    }
    
    phoneNumberStr = [gPhoneCache objectForKey:phone];
    if (phoneNumberStr == nil) {
        phoneNumberStr = [self formatPhoneNumber:phone];
        [gPhoneCache setObject:phoneNumberStr forKey:phone];
    }
//    [_phoneLock unlock];
    
    return phoneNumberStr;
}

-(NSString *)formatPhoneNumber:(NSNumber *)phone{
    
    return nil;
}
@end
