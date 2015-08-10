//
//  ShareViewModel.m
//  Share SoundCloud
//
//  Created by Apro on 10/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ShareViewModel.h"
#import "Track.h"
#import "NSArray+Helper.h"

static const int kNumberOfCells = 16;

@implementation ShareViewModel

- (nonnull instancetype)initWithTracks:(nullable NSArray *)tracks error:(nullable NSError *)error
{
    self = [super init];
    if (self) {
        _tracks = [self p_setupVMWithTracks:tracks];
        _error = error;
    }
    return self;
}

- (nonnull NSArray *) p_setupVMWithTracks:(nonnull NSArray *) tracks{

    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfCells];
    
    for (int i = 0; i < tracks.count; i++) {
        [tmpArray addObject:tracks[i]];
        [tmpArray addObject:tracks[i]];
    }
    return [tmpArray shuffled];
}

@end
