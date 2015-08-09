//
//  TrackList.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackList :  NSObject

/// List of Tracks.
@property(nonnull, nonatomic, strong, readonly) NSArray *tracks;

NS_ASSUME_NONNULL_BEGIN

-(instancetype)initWithTracks:(NSArray *) tracks NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

NS_ASSUME_NONNULL_END

@end
