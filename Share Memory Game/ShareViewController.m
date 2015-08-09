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
#import "GameCollectionViewDataSource.h"
#import "GameCollectionViewDelegate.h"
#import "ShareViewModel.h"

@interface ShareViewController () <ShareViewInterface, DataProvider>{
    IBOutlet UICollectionView *__weak _collectionView;
    SharePresenterImpl *_presenter;
    GameCollectionViewDataSource *_collectionViewDS;
    GameCollectionViewDelegate *_collectionViewDelegate;
}

@end

@implementation ShareViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _presenter = [[SharePresenterImpl alloc] initWithView:self];
    [_presenter setup];
    [self p_setupCollectionView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self p_animateViewAppearance];
}

- (IBAction)doneBtnPressed:(id)sender {
    [self p_animateViewDisappearance];
}

#pragma mark - private methods.

- (void)p_setupCollectionView {
    _collectionViewDelegate = [[GameCollectionViewDelegate alloc] initWithProvider:self];
    _collectionView.delegate = _collectionViewDelegate;
    
    _collectionViewDS = [[GameCollectionViewDataSource alloc] initWithProvider:self];
    _collectionView.dataSource = _collectionViewDS;
}

- (void)p_animateViewAppearance{
    
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

- (void)setViewModel:(ShareViewModel *)vieWModel{
    _viewModel = vieWModel;
    
    if (!vieWModel.error) {
        [_collectionView reloadData];
    }else{
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Network Error", nil)
                                            message:NSLocalizedString(@"Please try again!", nil)
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertC animated:YES completion:nil];
    }
}


@end
