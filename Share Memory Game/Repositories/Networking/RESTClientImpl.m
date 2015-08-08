//
//  RESTClient.m
//  Share SoundCloud
//
//  Created by Apro on 06/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "RESTClientImpl.h"
#import "TrackList.h"

static NSString *const kBaseURL = @"https://api.soundcloud.com";
static NSString *const kResolvePath = @"resolve";
static NSString *const kUserTracksPath = @"/users/%@/tracks";

static NSString *const kPermalinkKey = @"url";
static NSString *const kClientIdKey = @"client_id";
static NSString *const kClientIdValue = @"57fe511433de3267094fb2fb8fd77f0c";

static const int kHttpOkStatus = 200;

static RESTClientImpl *sInstance;

@implementation RESTClientImpl{
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

- (void)fetchTrackListWithC{
    NSURL *url = [NSURL URLWithString:[kBaseURL stringByAppendingFormat:@"%@", kResolvePath]];
    [[_urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
        
        if (!error && httpResp.statusCode == kHttpOkStatus) {
            
            NSError *jsonError;
            
            TrackList *tracks = [[TrackList alloc] initWithData:data error:&jsonError];
            if (!jsonError) {
                
            }
        }
    }] resume];
}

- (nonnull NSString *) urlParams:(nonnull NSDictionary *) dict{
    NSMutableString *urlParams = [NSMutableString new];
    
    for (NSString *key in [dict allKeys]) {
        [urlParams appendFormat:@"%@=%@", key, dict[key]];
    }
    return urlParams;
}

@end
