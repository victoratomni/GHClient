//
//  MainViewController.h
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

// List of repos
@property (nonatomic, strong) IBOutlet UITableView *tableView;

// Abstract of the currently selected repo
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;

// Show a table with all info about the repo
@property (nonatomic, strong) IBOutlet UIButton *infoButton;

@end
