//
//  GameCollectionViewDelegate.m
//  Share SoundCloud
//
//  Created by Apro on 09/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "GameCollectionViewDelegate.h"

@implementation GameCollectionViewDelegate

- (nonnull instancetype)initWithProvider:(nonnull id<DataProvider>)provider
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
