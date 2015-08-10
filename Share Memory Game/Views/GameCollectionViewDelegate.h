//
//  GameCollectionViewDelegate.h
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@class SharePresenterImpl;

@interface GameCollectionViewDelegate : NSObject <UICollectionViewDelegate>

- (nonnull instancetype)initWithPresenter:(nonnull SharePresenterImpl *) presenter NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

@end
