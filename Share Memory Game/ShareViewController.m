//
//  ShareViewController.m
//  Share Memory Game
//
//  Created by Apro on 05/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ShareViewController.h"
#import "SharePresenterImpl.h"
#import "ShareViewInterface.h"

@interface ShareViewController () <ShareViewInterface>{
    __weak IBOutlet UICollectionView *_collectionView;
    SharePresenterImpl *_presenter;
    NSArray *_viewModel;
}

@end

@implementation ShareViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _presenter = [[SharePresenterImpl alloc] initWithView:self];
    [_presenter setup];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self p_animateViewAppearance];
}

- (IBAction)doneBtnPressed:(id)sender {
    [self p_animateViewDisappearance];
}

#pragma mark - private methods.

- (void)p_animateViewAppearance
{
    self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)p_animateViewDisappearance {
    [UIView animateWithDuration:0.20 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        [self.extensionContext completeRequestReturningItems:nil completionHandler:nil];
    }];
}

#pragma mark - view interface methods

- (void)setViewModel:(NSArray *)vieWModel{
    _viewModel = vieWModel;
    [_collectionView reloadData];
}


@end
