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
#import "RESTClientImpl.h"
@import MobileCoreServices;
#import "ShareViewModel.h"
#import "TrackListResponseModel.h"
#import "Track.h"

static NSString *const kURL = @"https://soundcloud.com/octobersveryown/drake-back-to-back-freestyle"; // TODO - to be removed.

static const int kNumOfTracksToDisplay = 9;
static const NSInteger kUnitialised = -1;

@implementation SharePresenterImpl{
    id<ShareViewInterface> __weak _view;
    NSInteger _prevIndex;
    ShareViewModel *_viewModel;
}

- (instancetype)initWithView:(id<ShareViewInterface>) view{
    self = [super init];
    if (self) {
        _view = view;
        _prevIndex = kUnitialised;
    }
    return self;
}


- (void) setup{
    [_tracksInteractor fetchTracksWithURL:kURL]; // TODO: - remove
//    [self p_extractTrackURL];
}


// Extracts track/playlist URL from extension context.
- (void)p_extractTrackURL{
    
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

- (void)didSelectItemAtIndex:(NSInteger)index{
    if (_prevIndex != kUnitialised) {
        Track *prevTrack = _viewModel.tracks[_prevIndex];
        Track *currTrack = _viewModel.tracks[index];
        
        if (currTrack.identity == prevTrack.identity && prevTrack.isDisplaying) {
            currTrack.discovered = YES;
            prevTrack.discovered = YES;
            _prevIndex = kUnitialised;
        }else{
            prevTrack.displaying = NO;
            currTrack.displaying = YES;
            _prevIndex = index;
        }
        
    }else{
        Track *track = _viewModel.tracks[index];
        track.displaying = YES;
        _prevIndex = index;
    }
    [_view setViewModel:_viewModel];
}

- (BOOL)shouldSelectItemAtIndex:(NSInteger)index{
    Track *track = _viewModel.tracks[index];
    
    if (track.isDiscovered) {
        return NO;
    }else{
        return YES;
    }
}


- (void)setResponseModel:(nonnull TrackListResponseModel *)response{
    NSArray *eightTracks = [self p_arrayOfFirstEightElems:response];
    _viewModel = [[ShareViewModel alloc] initWithTracks:eightTracks error:response.error];
    [_view setViewModel:_viewModel];
}

- (nonnull NSArray *) p_arrayOfFirstEightElems:(TrackListResponseModel *) responseModel{
    NSArray *tracks = responseModel.trackList.tracks;
    
    if (tracks.count > kNumOfTracksToDisplay) {
        return [tracks subarrayWithRange:NSMakeRange(0, kNumOfTracksToDisplay)];
    }else{
        return responseModel.trackList.tracks;
    }
}

@end
