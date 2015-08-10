//
//  NSArray+Helper.m
//  Share SoundCloud
//
//  Created by Apro on 10/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)

- (NSArray *) shuffled
{
    // create temporary autoreleased mutable array
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id anObject in self)
    {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    
    return [tmpArray copy];
}


@end
