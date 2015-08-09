//
//  TrackListResponse.m
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackListResponseModel.h"

@implementation TrackListResponseModel

- (nonnull instancetype)initWithTrackList:(nullable TrackList *)tracks error:(nullable NSError *)error{
    self = [super init];
    if (self) {
        _trackList = tracks;
        _error = error;
    }
    return self;
}

@end
