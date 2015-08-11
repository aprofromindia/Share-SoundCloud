//
//  SharePresenter.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SharePresenter.h"
#import "ShareViewInterface.h"

@interface SharePresenterImpl : NSObject <SharePresenter>

- (nonnull instancetype)initWithView:(nonnull id<ShareViewInterface>) view NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void) setup;

- (void)didSelectItemAtIndex:(NSInteger)index;

- (BOOL) shouldSelectItemAtIndex:(NSInteger)index;

@end
