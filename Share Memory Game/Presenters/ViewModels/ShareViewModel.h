//
//  ShareViewModel.h
//  Share SoundCloud
//
//  Created by Apro on 10/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareViewModel : NSObject

@property (nullable, nonatomic, copy) NSArray *tracks;

@property (nullable, nonatomic, strong) NSError *error;

- (nonnull instancetype)initWithTracks:(nullable NSArray *) tracks error:(nullable NSError *) error NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

@end
