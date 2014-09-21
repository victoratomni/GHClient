//
//  RepoModel.h
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepoModel : NSObject

@property (nonatomic, strong) NSDictionary *info;
@property (nonatomic, strong) NSArray *repoInfoArray;
@property (copy) NSString *name;

-(id) initRepoWith:(NSDictionary *)info;
-(NSString *) repoInfo;

@end
