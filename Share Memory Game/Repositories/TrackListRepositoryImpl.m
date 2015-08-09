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

@interface TrackListRepositoryImpl ()

@end

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

- (void)fetchUserIdWithURL:(nonnull NSString *)trackURL
                   success:(nonnull void (^)(NSString * __nullable))successBlock
                     error:(nonnull void (^)(NSError * __nullable))errorBlock{
    
    [_restClient fetchTrackWithURL:trackURL success:^(Track *track) {
        [self fetchTrackListforUser:track.userId success:^(TrackList *tracks) {
            
        } error:^(NSError *error) {
            
        }];
        
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}

- (void)fetchTrackListforUser:(nonnull NSString *)userId
                      success:(nonnull void (^)(TrackList * __nullable))successBlock
                        error:(nonnull void (^)(NSError * __nullable))errorBlock{
    
    [_restClient fetchTrackListforUser:userId success:^(TrackList *tracks) {
        successBlock(tracks);
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}

@end
