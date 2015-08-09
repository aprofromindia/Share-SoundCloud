//
//  TrackRepository.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackListRepository.h"
#import "RESTClient.h"

@interface TrackListRepositoryImpl : NSObject <TrackListRepository>

NS_ASSUME_NONNULL_BEGIN

- (instancetype)initWithRESTClient:(id<RESTClient>) restClient NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

NS_ASSUME_NONNULL_END

@end
