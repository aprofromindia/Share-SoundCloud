//
//  RESTClient.h
//  Share SoundCloud
//
//  Created by Apro on 06/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestClient.h"

@interface RESTClientImpl : NSObject <RESTClient>{
    NSURLSession *_urlSession;
}

+ (nonnull instancetype) sharedInstance;

@end
