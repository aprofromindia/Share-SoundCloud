//
//  TrackListInteractor.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SharePresenter.h"
#import "TrackListRepository.h"
@class TrackList;

@interface TrackListInteractor : NSObject

- (nonnull instancetype)initWithPresenter:(nonnull id<SharePresenter>) presenter
                       repository:(nonnull id<TrackListRepository>) repository NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void) fetchTracks;

@end
