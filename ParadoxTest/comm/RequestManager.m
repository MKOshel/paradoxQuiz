//
//  RequestManager.m
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import "RequestManager.h"

#define URL_PHOTOS @"http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=20&minx=20&miny=20&maxx=100&maxy=100&size=medium&mapfilter=true"
@implementation RequestManager

+(RequestManager*)sharedInstance
{
    static RequestManager* client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[RequestManager alloc]init];
    });
    
    return client;
}

-(id)init
{
    if (self = [super init]) {
        [self setupSession];
    }
    return self;
}

-(void)setupSession
{
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _sessionManager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
    
    _serializer = [AFJSONRequestSerializer serializer];
    _sessionManager.requestSerializer = _serializer;
    
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

}


-(void)getPhotos
{
    
    [_sessionManager GET:URL_PHOTOS parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
        if ([self.photoDelegate respondsToSelector:@selector(didReceivePhotoList:)])
        {
            [self.photoDelegate didReceivePhotoList:[responseObject objectForKey:@"photos"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
        if ([self.photoDelegate respondsToSelector:@selector(didReceiveError:)])
        {
            [self.photoDelegate didReceiveError:error];
        }

    }];

}


@end
