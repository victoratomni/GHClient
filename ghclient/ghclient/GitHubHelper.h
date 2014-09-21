//
//  GitHubHelper.h
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GitHubHelper : NSObject <NSURLConnectionDelegate>

+ (GitHubHelper *) sharedRequestHelper;

-(void) login:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler;

-(void) repositoryList:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler;

@end
