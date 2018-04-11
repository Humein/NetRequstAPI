//
//  ZTKTestRequestAPI.h
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/4/11.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKBaseNetRequest.h"

/**
 *  成功。
 *  @param responseObject 返回的数据。
 */
typedef void(^Succsess)(NSString *succMessage,id responseObject, NSInteger succCode);

/**
 *  失败。
 *  @param error 失败原因。
 */
typedef void(^Failure)(NSString *errorMessage, id result, NSInteger errorCode);
@interface ZTKTestRequestAPI : ZTKBaseNetRequest
/*
 参数
 参数名    类型    可选    备注
 
 返回值
 result BOOL 否 修改结果
 resultmessage string 否 描述
 */
+(void)requestSeckillPayWaWithParameter:(NSDictionary *)dic withSuccess:(Succsess)succsess andFailure:(Failure)failure;
@end
