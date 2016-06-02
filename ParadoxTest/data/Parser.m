//
//  Parser.m
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+(Photo*)parsePhoto:(NSDictionary *)dict
{
    NSString* url  = [dict valueForKey:@"photo_file_url"];
    NSString* name = [dict valueForKey:@"owner_name"];
    
    Photo* p = [[Photo alloc]initWithOwnerName:name andURL:url];
    
    return p;
}

@end
