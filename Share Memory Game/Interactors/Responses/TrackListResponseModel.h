//
//  TrackListResponse.h
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TrackList;

@interface TrackListResponseModel : NSObject

@property (nullable, nonatomic, strong, readonly) TrackList *trackList;

@property (nullable, nonatomic, strong, readonly) NSError *error;


- (nonnull instancetype)initWithTrackList:(nullable TrackList *) tracks
                            error:(nullable NSError *) error NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

@end
