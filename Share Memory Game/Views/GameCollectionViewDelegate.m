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
    NSIndexPath *_prevIndexPath;
}

- (nonnull instancetype)initWithPresenter:(nonnull SharePresenterImpl *)presenter
{
    self = [super init];
    if (self) {
        _presenter = presenter;
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [_presenter didSelectItemAtIndex:indexPath.row];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return [_presenter shouldSelectItemAtIndex:indexPath.row];
}

@end
