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

static NSString *const kURLKey = @"url";
static NSString *const kClientIdKey = @"client_id";
static NSString *const kClientIdValue = @"57fe511433de3267094fb2fb8fd77f0c";

static const int kHttpOkStatus = 200;

static RESTClientImpl *sInstance;

@interface RESTClientImpl ()

@end

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

- (void)fetchTrackListforUser:(NSString *)userId
                      success:(void (^)(TrackList * ))successBlock
                        error:(void (^)(NSError *))errorBlock{
    
    static NSString *const kUserTracksPath = @"/users/%@/tracks";
    
    [self p_requestWithURL:[kBaseURL stringByAppendingFormat:kUserTracksPath, userId] params:@{kClientIdKey : kClientIdValue}
                   success:^(NSData *data) {
                       
                   } failure:^(NSError *error) {
                       
                   }];
}

- (void)fetchTrackWithURL:(NSString *)trackURL
                  success:(void (^)(Track *))successBlock
                    error:(void (^)(NSError *))errorBlock{
    
    static NSString *const kResolvePath = @"/resolve";
    
    [self p_requestWithURL:[kBaseURL stringByAppendingString:kResolvePath] params:@{kClientIdKey: kClientIdValue,
                                                                                    kURLKey: trackURL}
                   success:^(NSData *data) {
                       NSError *jsonError;
                       Track *track = [[Track alloc] initWithData:data error:&jsonError];
                       
                       if (!jsonError) {
                           successBlock(track);
                       }
                   } failure:^(NSError *error) {
                       
                   }];
}

#pragma mark - private methods.

- (void)p_requestWithURL:(nonnull NSString *) urlString
                  params:(nonnull NSDictionary *) params
                 success:(nonnull void (^)(NSData *__nullable)) successBlock
                 failure:(nonnull void (^)(NSError *__nullable)) failureBlock{
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAppendingFormat:@"?%@", [self p_urlParams:params]]];
    [[_urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
        
        if (!error && httpResp.statusCode == kHttpOkStatus) {
            successBlock(data);
        }else{
            failureBlock(error);
        }
    }] resume];
}

- (nonnull NSString *) p_urlParams:(nonnull NSDictionary *) dict{
    NSMutableString *urlParams = [NSMutableString new];
    
    for (NSString *key in [dict allKeys]) {
        [urlParams appendFormat:@"%@=%@", key, dict[key]];
    }
    return urlParams;
}

@end
