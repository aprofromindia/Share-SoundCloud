//
//  ShareMemoryGameDependencies.h
//  Share SoundCloud
//
//  Created by Apro on 11/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShareViewController;

@interface ShareMemoryGameDependencies : NSObject

- (void) injectView:(nonnull ShareViewController *) view;

@end
