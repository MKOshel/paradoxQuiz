//
//  Photo.h
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property(nonatomic,strong) NSString* owner;
@property(nonatomic,strong) NSString* imageURL;

-(id)initWithOwnerName:(NSString*)owner andURL:(NSString*)photoURL;

@end
