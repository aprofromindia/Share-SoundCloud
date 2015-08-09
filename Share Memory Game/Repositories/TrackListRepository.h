//
//  TrackRepository.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Track, TrackList;

@protocol TrackListRepository <NSObject>

- (void) fetchTrackListforUser:(nonnull NSString *) userId
                       success:(nonnull void (^)(TrackList *__nullable)) successBlock
                         error:(nonnull void(^)(NSError *__nullable)) errorBlock;

- (void) fetchUserIdWithURL:(nonnull NSString *) trackURL
                    success:(nonnull void (^)(NSString *__nullable)) successBlock
                      error:(nonnull void(^)(NSError *__nullable)) errorBlock;
@end
