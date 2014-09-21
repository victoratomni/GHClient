//
//  MainViewController.m
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import "MainViewController.h"
#import "GitHubHelper.h"
#import "RepoModel.h"
#import "RepoTableViewCell.h"
#import "InfoTableViewController.h"

@interface MainViewController () {
    
    // Array of repository model objects
    NSArray *_repositories;
    
    // The selected repo in the list
    RepoModel *_currentRepo;
}

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.infoLabel.layer.cornerRadius = 5;
    self.infoButton.layer.cornerRadius = 5;
    
    // Fetch and setup a list of all repositories
    [self createRepositoryList];
    
    // Check if the user should login
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"loggedIn"]) {
        [self performSegueWithIdentifier:@"loginId" sender:self];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Fetch and setup the list of repos
-(void) createRepositoryList
{
    [[GitHubHelper sharedRequestHelper] repositoryList:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError* error;
        NSArray* repositories = [NSJSONSerialization
                                 JSONObjectWithData:data
                                 options:NSJSONReadingAllowFragments
                                 error:&error];
        
        NSMutableArray *models = [[NSMutableArray alloc] init];
        for (NSDictionary *repoDictionary in repositories) {
            
            RepoModel *repoModel = [[RepoModel alloc] initRepoWith:repoDictionary];
            [models addObject:repoModel];
        }
        _repositories = [[NSArray alloc] initWithArray:models];
        [self.tableView reloadData];
    }];
}

// When clicking the "More"-button the information for the destination view controller is set
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *identifier = segue.identifier;
    
    if ([identifier isEqualToString:@"loginId"]) {
        
    } else {
        InfoTableViewController *vc = (InfoTableViewController *)[segue destinationViewController];
        if (_currentRepo) {
            vc.repoArray = _currentRepo.repoInfoArray;
            vc.title = _currentRepo.name;
        }
    }
}

#pragma mark - Table View Delegates and Datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repoId" forIndexPath:indexPath];
    
    RepoModel *repo = _repositories[indexPath.row];
    cell.nameLabel.text = repo.name;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _repositories.count;
}

// Show an abstract of the repo in the infoLabel
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.infoButton.hidden)
        self.infoButton.hidden = NO;
    
    _currentRepo = _repositories[indexPath.row];
    self.infoLabel.text = [_currentRepo repoInfo];
}
@end
