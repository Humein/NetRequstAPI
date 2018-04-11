//
//  ZTKBaseNetRequest.m
//  NetRequstAPI_Example
//
//  Created by 鑫鑫 on 2018/4/11.
//  Copyright © 2018年 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKBaseNetRequest.h"
#import "ZTKRequestCodeTool.h"
@implementation ZTKBaseNetRequest
// 重写请求入口
- (void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure {
    
    [super startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        id responseObject =nil;
        if (request.responseJSONObject) {
            responseObject= request.responseJSONObject;
        }else if(request.responseData){
            responseObject= [NSJSONSerialization JSONObjectWithData:request.responseData options:0 error:nil];
        }else{
            if(failure){
                failure([self getNetRequestErrorState:request]);
            }
            return ;
        }
        
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *requestToken = [[request requestHeaderFieldValueDictionary] objectForKey:@"token"];
        switch (code) {
            case 0:{
                NSString *message = [responseObject objectForKey:@"message"];
                [[ZTKRequestCodeTool instance] handleRequestCode:code requestToken:requestToken message:message];
                break;
            }
            case 1:{
                if(success){
                    success(request);
                }
                break;
            }
            default:
                if(success){
                    success(request);
                }
                break;
        }
        
        if(![responseObject isKindOfClass:[NSDictionary class]]){
            if(failure){
                failure([self getNetRequestErrorState:request]);
            }
            return ;
        }
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
        if(failure){
            failure([self getNetRequestErrorState:request]);
        }
        
    }];
    
}

/**
 请求网络错误情况下，错误信息提示。
 
 @param request 修改request
 
 @return 返回子类 request.
 */
-(YTKBaseRequest*)getNetRequestErrorState:(YTKBaseRequest*)request{
    ZTKBaseNetRequest * childRequest=(ZTKBaseNetRequest*)request;
    
    NSLog(@"%@", [NSString stringWithFormat:@"Request %@ failed, status code = %ld",
                  NSStringFromClass([request class]), (long)request.responseStatusCode]);
    
    
    int networkState = 1;
    if (networkState == 0) {
        childRequest.ZTKErrorDic=@{@"message":@"网络错误，\n请检查您的网络"};
    }else{
        if (request.responseJSONObject) {
            childRequest.ZTKErrorDic=request.responseJSONObject;
        }else{
            childRequest.ZTKErrorDic=@{@"message":@"网络不稳定，请检查网络"};
        }
    }
    return  childRequest;
}

/// 请求成功的回调
- (void)requestCompleteFilter{
    [super requestCompleteFilter];
    if(_requestCompleteFilterBlock){
        _requestCompleteFilterBlock();
    }
}

/// 请求失败的回调
- (void)requestFailedFilter{
    [super requestFailedFilter];
    if(_requestFailedFilterBlock){
        _requestFailedFilterBlock();
    }
}

/// 用于在cache结果，计算cache文件名时，忽略掉一些指定的参数
- (id)cacheFileNameFilterForRequestArgument:(id)argument{
    if(_cacheFileNameFilterBlock){
        return _cacheFileNameFilterBlock;
    }else{
        return argument;
    }
}


- (NSString *)requestUrl {
    if(_requestUrl){
        _requestUrl=[_requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        return _requestUrl;
    }else{
        return @"";
    }
}
- (NSString *)baseUrl {
    if(_baseUrl){
        return _baseUrl;
    }else{
        return @"";
    }
}

- (NSTimeInterval)requestTimeoutInterval {
    if(_requestTimeoutInterval){
        return _requestTimeoutInterval;
    }else{
        return 20;
    }
}

- (id)requestArgument {
    if(_requestArgument){
        return _requestArgument;
    }else{
        return nil;
    }
}

- (YTKRequestMethod)requestMethod {
    if(_requestMethod){
        return _requestMethod;
    }else{
        return YTKRequestMethodGET;
    }
}

- (YTKRequestSerializerType)requestSerializerType {
    if(_requestSerializerType){
        return _requestSerializerType;
    }else{
        return YTKRequestSerializerTypeHTTP;
    }
}

- (NSArray *)requestAuthorizationHeaderFieldArray {
    if(_requestAuthorizationHeaderFieldArray){
        return _requestAuthorizationHeaderFieldArray;
    }else{
        return nil;
    }
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *requestheaders = [[NSMutableDictionary alloc] initWithCapacity:4];
    [requestheaders setValue:@"2" forKey:@"appType"];
    return requestheaders;
    
}

- (NSURLRequest *)buildCustomUrlRequest {
    if(_buildCustomUrlRequest){
        return _buildCustomUrlRequest;
    }else{
        return nil;
    }
}

- (id)jsonValidator {
    if(_jsonValidator){
        return _jsonValidator;
    }else{
        return nil;
    }
}

- (BOOL)statusCodeValidator {
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    } else {
        return NO;
    }
}

- (AFConstructingBlock)constructingBodyBlock {
    if(_ZTKconstructingBodyBlock){
        return _ZTKconstructingBodyBlock;
    }else{
        return nil;
    }
}

- (NSString *)resumableDownloadPath {
    if(_ZTKresumableDownloadPath){
        return _ZTKresumableDownloadPath;
    }else{
        return nil;
    }
}

- (AFURLSessionTaskProgressBlock)resumableDownloadProgressBlock {
    if(_ZTKresumableDownloadProgressBlock){
        return _ZTKresumableDownloadProgressBlock;
    }else{
        return nil;
    }
}

- (NSInteger)cacheTimeInSeconds{
    
    
    if(_cacheTimeInSecond){
        return _cacheTimeInSecond;
    }else{
        return [super cacheTimeInSeconds];
    }
}

- (long long)cacheVersion{
    if(_cacheVersion){
        return _cacheVersion;
    }else{
        return [super cacheVersion];
    }
}

- (id)cacheSensitiveData{
    if(_cacheSensitiveData){
        return _cacheSensitiveData;
    }else{
        return [super cacheSensitiveData];
    }
}

-(void)clearAllCache{
    if([self respondsToSelector:@selector(cacheBasePath)]){
        NSString *path = [self performSelector:@selector(cacheBasePath)];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:path error:nil];
    }else{
    }
}


@end
