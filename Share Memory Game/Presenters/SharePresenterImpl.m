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
#import "ShareViewModel.h"
#import "TrackListResponseModel.h"

static NSString *const kURL = @"https://soundcloud.com/octobersveryown/drake-back-to-back-freestyle"; // TODO - to be removed.

static const int kViewModelMaxArraySize = 8;

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
    [_tracksInteractor fetchTracksWithURL:kURL]; // TODO: - remove
//    [self p_extractPermalink];
}


// Extracts track/playlist URL from extension context.
- (void)p_extractPermalink{
    
    for (NSExtensionItem *item in _view.extensionContext.inputItems) {
        
        for (NSItemProvider *provider in item.attachments) {
            
            [provider loadItemForTypeIdentifier:(NSString *) kUTTypeURL options:nil
                              completionHandler:^(id<NSSecureCoding> item, NSError *error) {
                                  
                                  if (!error) {
                                      NSString *trackURL = ((NSURL *) item).absoluteString;
                                      [_tracksInteractor fetchTracksWithURL:trackURL];
                                  }
                              }];
        }
    }
}


- (void)setResponseModel:(nonnull TrackListResponseModel *)response{
    NSArray *tracksVM = [self p_getViewModelArray:response];
    [_view setViewModel:[[ShareViewModel alloc] initWithTracks:tracksVM error:response.error]];
}

- (nonnull NSArray *) p_getViewModelArray:(TrackListResponseModel *) responseModel{
    NSArray *tracks = responseModel.trackList.tracks;
    
    if (tracks.count > kViewModelMaxArraySize) {
        return [tracks subarrayWithRange:NSMakeRange(0, kViewModelMaxArraySize)];
    }else{
        return responseModel.trackList.tracks;
    }
}

@end
