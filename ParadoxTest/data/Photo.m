//
//  Photo.m
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(id)initWithOwnerName:(NSString*)owner andURL:(NSString*)photoURL
{
    if (self = [super init]) {
        _imageURL = photoURL;
        _owner = owner;
    }
    
    return self;
}


@end
