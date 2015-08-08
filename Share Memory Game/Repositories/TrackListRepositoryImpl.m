//
//  TrackRepository.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackListRepositoryImpl.h"
#import "TrackList.h"
#import "RESTClient.h"

@implementation TrackListRepositoryImpl{
    id<RESTClient> _restClient;
}

- (instancetype)initWithRESTClient:(id<RESTClient>) restClient
{
    self = [super init];
    if (self) {
        _restClient = restClient;
    }
    return self;
}

- (void)fetchTrackListWithHandler:(void (^)(TrackList *))handler{
//    [_restClient ];
}
@end
