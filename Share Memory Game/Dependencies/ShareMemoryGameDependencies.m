//
//  ShareMemoryGameDependencies.m
//  Share SoundCloud
//
//  Created by Apro on 11/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ShareMemoryGameDependencies.h"
#import "SharePresenterImpl.h"
#import "ShareViewController.h"
#import "TrackListRepositoryImpl.h"
#import "RESTClientImpl.h"
#import "TrackListInteractor.h"

@implementation ShareMemoryGameDependencies

- (void) injectView:(ShareViewController *)view{
    SharePresenterImpl *presenter = [[SharePresenterImpl alloc] initWithView:view];
    
    TrackListRepositoryImpl *repository = [[TrackListRepositoryImpl alloc]
                                           initWithRESTClient:[RESTClientImpl sharedInstance]];
    
    TrackListInteractor *interactor = [[TrackListInteractor alloc] initWithPresenter:presenter repository:repository];
    
    presenter.tracksInteractor = interactor;
    view.presenter = presenter;
}

@end
