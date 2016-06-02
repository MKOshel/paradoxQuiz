//
//  RequestManager.h
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol PhotoDelegate <NSObject>

@required
-(void)didReceivePhotoList:(NSArray*)photoList;
@optional
-(void)didReceiveError:(NSError*)error;

@end

@interface RequestManager : NSObject

@property(nonatomic,strong) id <PhotoDelegate> photoDelegate;
+ (RequestManager*)sharedInstance;
- (void)getPhotos;

////////////////////////////////
@property(nonatomic,strong) AFHTTPSessionManager* sessionManager;
@property(nonatomic,strong) AFJSONRequestSerializer* serializer;
////////////////////////////////


@end
