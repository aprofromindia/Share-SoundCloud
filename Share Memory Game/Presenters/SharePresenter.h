//
//  SharePresenter.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TrackListResponseModel;

@protocol SharePresenter <NSObject>

- (void) setResponseModel:(nonnull TrackListResponseModel *) response;

@end
