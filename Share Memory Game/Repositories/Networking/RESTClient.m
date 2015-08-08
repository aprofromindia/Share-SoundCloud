//
//  RESTClient.m
//  Share SoundCloud
//
//  Created by Apro on 06/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "RESTClient.h"

static RESTClient *sInstance;

@implementation RESTClient{
    NSURLSession *_urlSession;
}


+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
        sInstance->_urlSession = [NSURLSession sharedSession];
    });
    return sInstance;
}

@end
