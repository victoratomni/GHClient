//
//  LoginViewController.h
//  ghclient
//
//  Created by Victor Rendon on 2014-09-19.
//  Copyright (c) 2014 Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)submitClick:(id)sender;
@end
