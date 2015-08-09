//
//  Track.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@protocol Track <NSObject>

@end

@interface Track : JSONModel

/// Track id
@property(nonnull, nonatomic, copy) NSString *identity;

/// User id
@property(nonnull, nonatomic, copy) NSString *userId;

/// artwork Image URL.
@property(nonnull, nonatomic, copy) NSString *artworkURL;

@end
