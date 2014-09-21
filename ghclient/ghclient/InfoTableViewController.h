//
//  InfoTableViewController.h
//  ghclient
//
//  Created by Victor Rendon on 2014-09-19.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepoModel.h"

@interface InfoTableViewController : UITableViewController

// Array with all repository info
@property (nonatomic, strong) NSArray *repoArray;

// Title for the repo for navbar
@property (copy) NSString *title;

@end
