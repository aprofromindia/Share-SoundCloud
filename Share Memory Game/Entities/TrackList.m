//
//  TrackList.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackList.h"

@implementation TrackList

- (instancetype)initWithTracks:(NSArray *)tracks {
    self = [super init];
    if (self) {
        _tracks = tracks;
    }
    return self;
}

@end
