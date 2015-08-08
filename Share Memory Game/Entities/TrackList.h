//
//  TrackList.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Track.h"

@interface TrackList :  JSONModel

@property(nonnull, nonatomic, copy) NSArray <Track, ConvertOnDemand>* tracks;

@end
