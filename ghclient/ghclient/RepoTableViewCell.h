//
//  RepoTableViewCell.h
//  ghclient
//
//  Created by Victor Rendon on 2014-09-18.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoTableViewCell : UITableViewCell

// This custom cell only have a label with the repo name
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
