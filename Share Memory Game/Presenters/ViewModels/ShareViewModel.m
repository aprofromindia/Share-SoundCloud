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

- (instancetype)initWithTracks:(NSArray *)tracks error:(NSError *)error
{
    self = [super init];
    if (self) {
        _tracks = [self p_setupVMWithTracks:tracks];
        _error = error;
    }
    return self;
}

- (NSArray *) p_setupVMWithTracks:(NSArray *) tracks{

    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfCells];
    
    for (int i = 0; i < tracks.count; i++) {
        
        Track *track = tracks[i];
        
        [tmpArray addObject:track];
        [tmpArray addObject:[track copy]];
    }
    return [tmpArray shuffled];
}

@end
