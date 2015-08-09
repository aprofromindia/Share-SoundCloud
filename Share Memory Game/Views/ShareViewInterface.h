//
//  ShareViewInterface.h
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShareViewModel;

@protocol ShareViewInterface <NSObject>

- (void) setViewModel:(nonnull ShareViewModel *) vieWModel;

- (nonnull NSExtensionContext *) extensionContext;

@end


@protocol DataProvider <NSObject>

- (nonnull ShareViewModel *) viewModel;

@end
