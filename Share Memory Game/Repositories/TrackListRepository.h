//
//  TrackRepository.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TrackList;

@protocol TrackListRepository <NSObject>

- (void) fetchTrackListWithHandler:(void(^)(TrackList *)) handler;

@end
