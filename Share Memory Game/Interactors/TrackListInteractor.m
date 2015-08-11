//
//  TrackListInteractor.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackListInteractor.h"
#import "TrackList.h"
#import "TrackListResponseModel.h"

@implementation TrackListInteractor{
    TrackList *_trackList;
    id<SharePresenter> __weak _presenter;
    id<TrackListRepository> _repository;
    NSError *_responseError;
}

- (instancetype)initWithPresenter:(id<SharePresenter>) presenter
                       repository:(id<TrackListRepository>) repository{
    
    self = [super init];
    if (self) {
        _presenter = presenter;
        _repository = repository;
    }
    return self;
}

- (void)fetchTracksWithURL:(NSString *)trackURL{
    [self p_fetchUserIdWithURL:trackURL];
}

#pragma mark - private methods

- (void)p_fetchUserIdWithURL:(NSString *) trackURL{
    [_repository fetchUserIdWithURL:(NSString *) trackURL success:^(NSUInteger userId) {
        [self p_fetchTracksWithId:userId];
    } error:^(NSError *error) {
        _responseError = error;
    }];
}

- (void)p_fetchTracksWithId:(NSUInteger) userId{
    [_repository fetchTrackListforUser:(NSUInteger) userId success:^(TrackList * tracks) {
        _trackList = tracks;
        [_presenter setResponseModel:[[TrackListResponseModel alloc] initWithTrackList:_trackList error:nil]];
    } error:^(NSError *error) {
        _responseError = error;
        [_presenter setResponseModel:[[TrackListResponseModel alloc] initWithTrackList:nil error:_responseError]];
    }];
}

@end
