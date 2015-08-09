//
//  TrackRepository.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackListRepositoryImpl.h"
#import "Track.h"
#import "RESTClient.h"
#import "TrackListInteractor.h"

@interface TrackListRepositoryImpl (){
    id<RESTClient> _restClient;
}

@property (nonnull, nonatomic, copy) void (^userIDSuccessBlock)(NSString *);

@property (nonnull, nonatomic, copy) void (^userIDErrorBlock)(NSError *);

@property (nonnull, nonatomic, copy) void (^trackListSuccessBlock)(TrackList *);

@property (nonnull, nonatomic, copy) void (^trackListErrorBlock)(NSError *);

@end

@implementation TrackListRepositoryImpl

- (instancetype)initWithRESTClient:(id<RESTClient>)restClient{
    self = [super init];
    if (self) {
        _restClient = restClient;
    }
    return self;
}

- (void)fetchUserIdWithURL:(nonnull NSString *)trackURL
                   success:(nonnull void (^)(NSString * __nullable))successBlock
                     error:(nonnull void (^)(NSError * __nullable))errorBlock{
    self.userIDSuccessBlock = successBlock;
    self.userIDErrorBlock = errorBlock;
    
    [_restClient fetchTrackWithURL:trackURL success:^(Track *track) {
        _userIDSuccessBlock(track.userId);
    } failure:^(NSError *error) {
        _userIDErrorBlock(error);
    }];
}

- (void)fetchTrackListforUser:(nonnull NSString *)userId
                      success:(nonnull void (^)(TrackList * __nullable))successBlock
                        error:(nonnull void (^)(NSError * __nullable))errorBlock{
    self.trackListSuccessBlock = successBlock;
    self.trackListErrorBlock = errorBlock;
    
    [_restClient fetchTrackListforUser:userId success:^(TrackList *tracks) {
        _trackListSuccessBlock(tracks);
    } failure:^(NSError *error) {
        _trackListErrorBlock(error);
    }];
}

@end
