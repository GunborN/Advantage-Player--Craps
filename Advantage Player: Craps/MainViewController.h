//
//  MainViewController.h
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/23/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ixlPlayerProfile.h"
#import "AppDelegate.h"

@interface MainViewController : UIViewController
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UILabel *labelFavNumber;
@property (nonatomic, retain) IBOutlet UITextField *textNumber;
@property (nonatomic, retain) IBOutlet UIButton *buttonSubmit;

- (IBAction)enterNumber;
@end
