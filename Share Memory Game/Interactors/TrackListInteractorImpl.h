//
//  TrackListInteractor.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackListInteractor.h"
@class TrackList;

@interface TrackListInteractorImpl : NSObject <TrackListInteractor>

- (void) fetchTracks;

- (TrackList *) getTracks;

@end
