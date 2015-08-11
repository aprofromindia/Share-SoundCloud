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

static const int kNumberOfCellsPerRow = 3;
static const int kViewCellHeight = 100;
static const int kViewCellSpacing = 10;

@implementation GameCollectionViewDelegate{
    SharePresenterImpl *_presenter;
    NSIndexPath *_prevIndexPath;
}

- (instancetype)initWithPresenter:(SharePresenterImpl *)presenter
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

#pragma mark - Layout methods 

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
                        sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((collectionView.frame.size.width - 2*kViewCellSpacing)/kNumberOfCellsPerRow, kViewCellHeight);
}

@end
