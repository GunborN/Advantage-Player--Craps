//
//  MainViewController.h
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/23/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ixlPlayerProfile.h"
#import "ixlEditFileObject.h"
#import "AppDelegate.h"

@interface MainViewController : UIViewController{
    ixlEditFileObject *ixlEditProfile;
    ixlPlayerProfile *ixlNewProfile;
}

////////These are for LOG and EDIT buttons///////
- (IBAction)editDictionary:(id)sender;
/////////////////////////////////////////////////


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UILabel *labelFavNumber;
@property (nonatomic, retain) IBOutlet UITextField *textNumber;
@property (nonatomic, retain) IBOutlet UIButton *buttonSubmit;
@property (nonatomic, retain) IBOutlet UILabel *currentArray;
@property IBOutlet ixlEditFileObject *ixlEditProfile;
@property IBOutlet ixlPlayerProfile *ixlNewProfile;

@end
