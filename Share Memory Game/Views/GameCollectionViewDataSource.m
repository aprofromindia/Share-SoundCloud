//
//  GameCollectionViewDataSource.m
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "GameCollectionViewDataSource.h"
#import <SDWebImage/UIImageView+WebCache.h>

static const int kMaxNumOfCellView = 16;
static NSString *const kCellIdentifier = @"GameCollectionViewCell";

@implementation GameCollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *viewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    return viewCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kMaxNumOfCellView;
}

@end
