//
//  GameCollectionViewDataSource.m
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "GameCollectionViewDataSource.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ShareViewModel.h"
#import "GameCollectionViewCell.h"
#import "Track.h"

@implementation GameCollectionViewDataSource{
    id<DataProvider> _provider;
}

- (instancetype)initWithProvider:(id<DataProvider>)provider
{
    self = [super init];
    if (self) {
        _provider = provider;
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *const kCellIdentifier = @"GameCollectionViewCell";
    GameCollectionViewCell *viewCell = (GameCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    Track *track = _provider.viewModel.tracks[indexPath.row];
    
    NSString *artworkURL = track.artworkURL;
    
    [viewCell.imgView sd_setImageWithURL:[NSURL URLWithString:artworkURL]];
    
    if (track.isDiscovered || track.isDisplaying) {
        viewCell.imgView.hidden = NO;
    }else{
        viewCell.imgView.hidden = YES;
    }
    return viewCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _provider.viewModel.tracks.count;
}

@end
