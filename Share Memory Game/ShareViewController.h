//
//  ShareViewController.h
//  Share Memory Game
//
//  Created by Apro on 05/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewInterface.h"
@class ShareViewModel, SharePresenterImpl;

@interface ShareViewController : UIViewController <ShareViewInterface>

@property (nonnull, nonatomic, strong, readonly) ShareViewModel *viewModel;

@property (nonnull, nonatomic, strong) SharePresenterImpl *presenter;

@end
