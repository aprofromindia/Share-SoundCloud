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

@property(nonnull, nonatomic, copy) NSString *identity;

@property(nonnull, nonatomic, copy) NSString *userId;

@property(nonnull, nonatomic, copy) NSString *artworkURL;

@end
