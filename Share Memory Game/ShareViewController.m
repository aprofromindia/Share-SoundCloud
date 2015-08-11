//
//  ShareViewController.m
//  Share Memory Game
//
//  Created by Apro on 05/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ShareViewController.h"
#import "SharePresenterImpl.h"
#import "GameCollectionViewDataSource.h"
#import "GameCollectionViewDelegate.h"
#import "ShareViewModel.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "ShareMemoryGameDependencies.h"

@interface ShareViewController () <DataProvider>{
    IBOutlet UICollectionView *__weak _collectionView;
    ShareMemoryGameDependencies *_dependencyManager;
    GameCollectionViewDataSource *_collectionViewDS;
    GameCollectionViewDelegate *_collectionViewDelegate;
    ShareViewModel *_viewModel;
}

@end

@implementation ShareViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _dependencyManager = [ShareMemoryGameDependencies new];
    [_dependencyManager injectView:self];
    
    [_presenter setup];
    [self p_setupCollectionView];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
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
    _collectionViewDelegate = [[GameCollectionViewDelegate alloc] initWithPresenter:_presenter];
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
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _viewModel = vieWModel;
    
    if (!vieWModel.error) {
        [_collectionView reloadData];
    }else{
        [self p_displayNetworkErrorAlert];
    }
}


- (void)p_displayNetworkErrorAlert {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Network Error", nil)
                                                                    message:NSLocalizedString(@"Please try again!", nil)
                                                             preferredStyle:UIAlertControllerStyleAlert];
    [alertC addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertC animated:YES completion:nil];
}

@end
