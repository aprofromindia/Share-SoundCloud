//
//  Track.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Track : JSONModel

/// Track id
@property(nonnull, nonatomic, copy) NSString *identity;

/// User id
@property(nonnull, nonatomic, copy) NSString *userId;

/// artwork Image URL.
@property(nonnull, nonatomic, copy) NSString<Optional> *artworkURL;

/// JSONModel Ignored bool property - set when Track is displayed.
@property (nonatomic, assign, getter=isDisplaying) BOOL displaying;

@end
