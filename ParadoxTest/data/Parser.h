//
//  Parser.h
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface Parser : NSObject

+(Photo*)parsePhoto:(NSDictionary*)dict;

@end
