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

static NSString *const kURL = @"https://soundcloud.com/octobersveryown/drake-back-to-back-freestyle";

@implementation SharePresenterImpl{
    id<ShareViewInterface> _view;
    TrackListInteractor *_tracksInteractor;
}

- (instancetype)initWithView:(id<ShareViewInterface>) view;
{
    self = [super init];
    if (self) {
        _view = view;
        RESTClientImpl *restClient = [RESTClientImpl sharedInstance];
        TrackListRepositoryImpl *tracksRepo = [[TrackListRepositoryImpl alloc] initWithRESTClient:restClient];
        _tracksInteractor = [[TrackListInteractor alloc] initWithPresenter:self repository:tracksRepo];
    }
    return self;
}


- (void)p_extractPermalink {
    for (NSExtensionItem *item in _view.extensionContext.inputItems) {
        
        for (NSItemProvider *provider in item.attachments) {
            
            [provider loadItemForTypeIdentifier:(NSString *) kUTTypeURL options:nil
                              completionHandler:^(id<NSSecureCoding> item, NSError *error) {
                if (!error) {
                    NSString *permalink = ((NSURL *) item).absoluteString;
                }
            }];
        }
    }
}

- (void) setup{
    [self p_extractPermalink];
}


- (void)setTracks:(TrackList *)trackList{
    [_view setViewModel:trackList.tracks];
}

@end
