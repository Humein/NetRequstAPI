//
//  ZTKTestRequestAPI.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/4/11.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//
#define STR_NET_RETURN_TYPE_ERROR @"返回类型错误"

#import "ZTKTestRequestAPI.h"
#import "ZTKRequestModel.h"
@implementation ZTKTestRequestAPI
+(void)requestSeckillPayWaWithParameter:(NSDictionary *)dic withSuccess:(Succsess)succsess andFailure:(Failure)failure{
    ZTKTestRequestAPI *requestAPI = [[ZTKTestRequestAPI alloc]init];
    requestAPI.requestUrl = @"https://ns.huatu.com/u/v3/users/bc/list";
    requestAPI.requestMethod = YTKRequestMethodGET;
    requestAPI.requestArgument = dic;
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
            failure([requestAPI.ZTKErrorDic objectForKey:@"message"],nil,0);
        }
    }];
    
    
}
@end
