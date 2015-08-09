//
//  TrackListInteractor.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "TrackListInteractor.h"
#import "TrackList.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation TrackListInteractor{
    TrackList *_trackList;
    id<SharePresenter> _presenter;
    id<TrackListRepository> _repository;
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

- (void)fetchTracks{
    
    @weakify(self);
    [_repository fetchTrackListWithHandler:^(TrackList *tracks) {
        @strongify(self);

        self->_trackList = tracks;
        [self->_presenter setTracks:self->_trackList];
    }];
}

@end
