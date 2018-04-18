//
//  ZTKTestRequestAPI.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/4/11.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//
#define STR_NET_RETURN_TYPE_ERROR @"https://knightsj.github.io/2017/07/18/YTKNetwork%E6%BA%90%E7%A0%81%E8%A7%A3%E6%9E%90/"

#import "ZTKTestRequestAPI.h"
#import "ZTKRequestModel.h"
@implementation ZTKTestRequestAPI
+(void)requestSeckillPayWaWithParameter:(NSDictionary *)dic withSuccess:(Succsess)succsess andFailure:(Failure)failure{
    ZTKTestRequestAPI *requestAPI = [[ZTKTestRequestAPI alloc]init];
    NSString *url1 = @"https://ns.huatu.com/u/v3/users/bc/list";
    requestAPI.requestUrl = url1;
    requestAPI.requestMethod = YTKRequestMethodGET;
    requestAPI.requestArgument = dic;
    requestAPI.cacheTimeInSecond = 5;
    requestAPI.requestCompleteFilterBlock = ^(void) {
        
    };
    requestAPI.requestFailedFilterBlock = ^(void) {
        
    };
    
    [requestAPI startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        id responseObject = request.responseJSONObject;
        if(![responseObject isKindOfClass:[NSDictionary class]]){
            if(failure){
                failure(STR_NET_RETURN_TYPE_ERROR,nil,0);
            }
            return ;
        }
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        if (code == 1000000){
            
            NSDictionary *obj = [responseObject objectForKey:@"data"];
            if (obj != nil) {
                NSDictionary *dataArr = [responseObject objectForKey:@"data"];
                NSMutableArray *dataArray = [[NSMutableArray alloc]init];
                for (NSDictionary  *dic in dataArr)
                {
                    //                    RequestModel *Item = [RequestModel objectWithKeyValues:dic];
                    //                    [dataArray addObject:Item];
                }
                
                if(succsess){
                    succsess(nil,[dataArray copy],code);
                }
                
            }
        }else{
            NSString *message = [responseObject objectForKey:@"message"];
            if(succsess){
                succsess(message,nil,code);
            }
            
        }
        
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        if(failure){
            failure([requestAPI.ZTKErrorDic objectForKey:@"message"],NSStringFromClass([request class]),request.responseStatusCode);
        }
    }];
    
    
}
@end
