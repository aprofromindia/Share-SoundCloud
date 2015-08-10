//
//  GameCollectionViewDelegate.m
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "GameCollectionViewDelegate.h"
#import "GameCollectionViewCell.h"
#import "SharePresenterImpl.h"

@implementation GameCollectionViewDelegate{
    SharePresenterImpl *_presenter;
}

- (nonnull instancetype)initWithPresenter:(nonnull SharePresenterImpl *)presenter
{
    self = [super init];
    if (self) {
        _presenter = presenter;
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    [_presenter didSelectItemAtIndexPath:indexPath.row];
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

@end
