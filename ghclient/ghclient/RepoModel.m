//
//  RepoModel.m
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import "RepoModel.h"

@implementation RepoModel

// Initialize a repository object with handy information
-(id) initRepoWith:(NSDictionary *)info
{
    self = [super init];
    if (self != nil) {
        self.info = info;
        self.name = info[@"name"];
        self.repoInfoArray = [self setupRepoInfoArray:info];
    }
    
    return self;
}

// An abstract of the repository info
-(NSString *) repoInfo
{
    return [NSString stringWithFormat:@"Full name\n%@\n\nProgramming language\n%@\n\nDescription\n%@", self.info[@"full_name"], self.info[@"language"], self.info[@"description"]];
}

// Create an array with keys and values of the Github API dictionary
-(NSArray *) setupRepoInfoArray:(NSDictionary *)info
{
    NSMutableArray *mutArr = [[NSMutableArray alloc] init];
    NSArray *keyArr = [[NSArray alloc] initWithArray:[info allKeys]];
    NSArray *valuesArr = [[NSArray alloc] initWithArray:[info allValues]];
    for (int i = 0; i < keyArr.count; i++) {
        [mutArr addObject:@{@"key": keyArr[i], @"value": valuesArr[i]}];
    }
    return [[NSArray alloc] initWithArray:mutArr];
}

@end
