//
//  RestClientImplSpec.m
//  Share SoundCloud
//
//  Created by Apro on 12/08/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import "Specta.h"
#import "RestClientImpl.h"

static NSString *const kURL = @"https://soundcloud.com/octobersveryown/drake-back-to-back-freestyle";

@interface RESTClientImpl (Test)

+ (nonnull instancetype) recreateSingleton;

@end

@implementation RESTClientImpl(Test)

+ (nonnull instancetype)recreateSingleton{
    RESTClientImpl *instance = nil;
    
    instance = [[RESTClientImpl alloc] init];
    instance->_urlSession = [NSURLSession sharedSession];
    return instance;
}

@end


SpecBegin(RestClientImpl)

describe(@"RestClientImpl", ^{
    
    __block RESTClientImpl *_restClient;
    
    beforeEach(^{
        _restClient = [RESTClientImpl recreateSingleton];
    });
    
    it(@"", ^{

    });  
    
    afterEach(^{
        _restClient = nil;
    });
    
});

SpecEnd
