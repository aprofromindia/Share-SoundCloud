//
//  TrackListInteractor.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackListInteractor.h"
#import "TrackList.h"

@implementation TrackListInteractor{
    TrackList *_trackList;
    id<SharePresenter> _presenter;
    id<TrackListRepository> _repository;
    NSError *_dataError;
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
    [_repository fetchUserIdWithURL:(NSString *) trackURL success:^(NSString *userId) {
        [self p_fetchTracksWithId:userId];
    } error:^(NSError *error) {
        _dataError = error;
    }];
}

- (void)p_fetchTracksWithId:(NSString *) userId{
    [_repository fetchTrackListforUser:(NSString *) userId success:^(TrackList * tracks) {
        _trackList = tracks;
        [_presenter setTracks:_trackList];
    } error:^(NSError *error) {
        _dataError = error;
    }];
}

@end
