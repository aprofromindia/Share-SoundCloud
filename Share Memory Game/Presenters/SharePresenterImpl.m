//
//  SharePresenter.m
//  Share SoundCloud
//
//  Created by Apro on 08/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "SharePresenterImpl.h"
#import "TrackList.h"
#import "TrackListInteractor.h"
#import "TrackListRepositoryImpl.h"
#import "RESTClientImpl.h"
@import MobileCoreServices;
#import <ReactiveCocoa/ReactiveCocoa.h>

static NSString *const kURL = @"https://soundcloud.com/octobersveryown/drake-back-to-back-freestyle";

@implementation SharePresenterImpl{
    id<ShareViewInterface> _view;
    TrackListInteractor *_tracksInteractor;
}

- (instancetype)initWithView:(id<ShareViewInterface>) view{
    self = [super init];
    if (self) {
        _view = view;
        RESTClientImpl *restClient = [RESTClientImpl sharedInstance];
        TrackListRepositoryImpl *tracksRepo = [[TrackListRepositoryImpl alloc] initWithRESTClient:restClient];
        _tracksInteractor = [[TrackListInteractor alloc] initWithPresenter:self repository:tracksRepo];
    }
    return self;
}


- (void) setup{
    [self p_extractPermalink];
}


/// Extracts track/playlist URL from extension context.

- (void)p_extractPermalink{
    
    for (NSExtensionItem *item in _view.extensionContext.inputItems) {
        
        for (NSItemProvider *provider in item.attachments) {
            
            @weakify(self);
            [provider loadItemForTypeIdentifier:(NSString *) kUTTypeURL options:nil
                              completionHandler:^(id<NSSecureCoding> item, NSError *error) {
                                  if (!error) {
                                      @strongify(self);
                                      self->_tracksInteractor.trackURL = ((NSURL *) item).absoluteString;
                                      [self->_tracksInteractor fetchTracks];
                                  }
                              }];
        }
    }
}


- (void)setTracks:(TrackList *)trackList{
    [_view setViewModel:trackList.tracks];
}

@end
