//
//  ShareViewModel.m
//  Share SoundCloud
//
//  Created by Apro on 10/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ShareViewModel.h"

@implementation ShareViewModel

- (nonnull instancetype)initWithTracks:(nullable NSArray *)tracks error:(nullable NSError *)error
{
    self = [super init];
    if (self) {
        _tracks = tracks;
        _error = error;
    }
    return self;
}

@end
