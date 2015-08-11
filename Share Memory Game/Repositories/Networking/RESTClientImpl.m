//
//  RESTClient.m
//  Share SoundCloud
//
//  Created by Apro on 06/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "RESTClientImpl.h"
#import "Track.h"
#import "TrackList.h"

static NSString *const kBaseURL = @"https://api.soundcloud.com";

static NSString *const kURLKey = @"url";
static NSString *const kClientIdKey = @"client_id";
static NSString *const kClientIdValue = @"57fe511433de3267094fb2fb8fd77f0c";
static NSString *const kJSONMimeType = @"application/json";

static const int kHttpOkStatus = 200;

static RESTClientImpl *sInstance;

@interface RESTClientImpl (){
    NSURLSession *_urlSession;
}

@end


@implementation RESTClientImpl

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[self alloc] init];
        sInstance->_urlSession = [NSURLSession sharedSession];
    });
    return sInstance;
}

- (void)fetchTrackWithURL:(NSString *)trackURL
                  success:(void (^)(Track *))successBlock
                  failure:(void (^)(NSError *))failureBlock{
    static NSString *const kResolvePath = @"/resolve";
    
    [self p_requestWithURL:[kBaseURL stringByAppendingString:kResolvePath] params:@{kClientIdKey: kClientIdValue,
                                                                                    kURLKey: trackURL}
                   success:^(NSData *data) {
                       
                       NSError *jsonError;
                       Track *track = [[Track alloc] initWithData:data error:&jsonError];
                       
                       if (!jsonError) {
                           successBlock(track);
                       }else{
                           failureBlock(jsonError);
                       }
                   } failure:^(NSError *error) {
                       failureBlock(error);
                   }];
}


- (void)fetchTrackListforUser:(NSUInteger)userId
                      success:(void (^)(TrackList * ))successBlock
                        failure:(void (^)(NSError *))failureBlock{
    static NSString *const kUserTracksPath = @"/users/%lu/tracks";
    
    [self p_requestWithURL:[kBaseURL stringByAppendingFormat:kUserTracksPath, (unsigned long)userId] params:@{kClientIdKey : kClientIdValue}
                   success:^(NSData *data) {
                       
                       NSError *jsonError;
                       NSArray *tracks = [Track arrayOfModelsFromData:data error:&jsonError];
                       
                       if (!jsonError) {
                           TrackList *trackList = [[TrackList alloc] initWithTracks:tracks];
                           successBlock(trackList);
                       }else{
                           failureBlock(jsonError);
                       }
                   } failure:^(NSError *error) {
                       failureBlock(error);
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
        
        if (!error && httpResp.statusCode == kHttpOkStatus && [response.MIMEType isEqualToString:kJSONMimeType]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock(data);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                failureBlock(error);
            });
        }
    }] resume];
}


/// Generates URL params from a NSDictionary.
- (nonnull NSString *) p_urlParams:(nonnull NSDictionary *) dict{
    NSMutableString *urlParams = [NSMutableString new];
    NSArray *keys = [dict allKeys];
    
    for (int i = 0 ; i < [keys count]; i++) {
        id key = keys[i];
        
        if (i == (keys.count -1)) {
            [urlParams appendFormat:@"%@=%@", key, dict[key]];
        }else{
            [urlParams appendFormat:@"%@=%@&", key, dict[key]];
        }
    }
    return urlParams;
}

@end
