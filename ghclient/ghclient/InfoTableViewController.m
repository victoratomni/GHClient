//
//  InfoTableViewController.m
//  ghclient
//
//  Created by Victor Rendon on 2014-09-19.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import "InfoTableViewController.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.title = self.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoRowId" forIndexPath:indexPath];
    
    // Set the property name and value
    NSDictionary *info = [self.repoArray objectAtIndex:indexPath.row];
    cell.textLabel.text = info[@"key"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", info[@"value"]];
    
    return cell;
}

@end
