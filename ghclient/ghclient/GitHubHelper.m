//
//  GitHubHelper.m
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import "GitHubHelper.h"

// Base url to git API
NSString* const BASE_URL = @"https://api.github.com";

// Path to list repositories
NSString* const REPO_LIST = @"/user/repos";


// Github OAuth2 token to authenticate use of my account in binary for better security
//NSString* const OAUTH_TOKEN = @"b813f179f046ca88a9a358ae2b256dc69a06cea3";

@interface GitHubHelper () {
    NSString *_oauthToken;
}

@end

@implementation GitHubHelper

static GitHubHelper *shared = nil;

// Initializer of the Github connection
-(id) init
{
    self = [super init];
    if (!self) {
        // Future init values
    }
    
    return self;
}

// Singleton
+ (GitHubHelper *) sharedRequestHelper
{
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        shared = [[GitHubHelper alloc] init];
    });
    
    return shared;
}

// Login to create OAuth2 token
-(void) login:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler
{
    NSURL *url = [NSURL URLWithString:BASE_URL];
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [mutableRequest setHTTPMethod:@"GET"];
//    [mutableRequest addValue:[NSString stringWithFormat:@"Token %@", OAUTH_TOKEN] forHTTPHeaderField:@"Authorization"];
    
    [NSURLConnection sendAsynchronousRequest:mutableRequest queue:[NSOperationQueue mainQueue] completionHandler:handler];
}

// Fetch the list of repositories from my Github account
-(void) repositoryList:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_URL, REPO_LIST]];
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [mutableRequest setHTTPMethod:@"GET"];
    [mutableRequest addValue:[NSString stringWithFormat:@"Token %@", _oauthToken] forHTTPHeaderField:@"Authorization"];
    
    [NSURLConnection sendAsynchronousRequest:mutableRequest queue:[NSOperationQueue mainQueue] completionHandler:handler];
}

#pragma mark - NSURLConnection Delegates

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed");
}


@end
