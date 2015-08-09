//
//  Track.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "Track.h"

@implementation Track

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"identity",
                                                       @"user_id" : @"userId",
                                                       @"artwork_url" : @"artworkURL"
                                                       }];
}

@end
