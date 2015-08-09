//
//  ShareViewInterface.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShareViewInterface <NSObject>

- (void) setViewModel:(nonnull TrackListResponse *) vieWModel;

- (nonnull NSExtensionContext *) extensionContext;

@end
