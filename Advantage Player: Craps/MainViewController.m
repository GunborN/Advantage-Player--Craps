//
//  MainViewController.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/23/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@implementation MainViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    /////////////testing stuff -- DELETE BEFORE FINALIZING//////////////
    ixlPlayerProfile *newProfile = [[ixlPlayerProfile alloc]init];
    newProfile.diceRolled = [[NSMutableArray alloc]init];
    NSInteger two,three,four,five,six,seven,eight,nine,ten,eleven,twelve;
    two = 2,three = 3,four = 4,five = 5,six = 6,seven = 7,eight = 8,nine = 9,ten = 10,eleven = 11,twelve = 12;
    newProfile.Name = @"Adam";
    newProfile.profileNumber = [NSNumber numberWithInt: 1];
    NSLog(@"Starting favored num = %@",newProfile.printFavoredNumber);
    
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:two]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:two]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:two]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:three]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:three]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:three]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:three]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:three]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:four]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:five]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:six]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:seven]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:eight]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:nine]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:ten]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:eleven]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:twelve]];
    
    NSLog(@"profile name = %@",newProfile.Name);
    NSLog(@"profile number = %@",newProfile.profileNumber);
    
    
    
    NSLog(@"Ending favored num = %@",newProfile.printFavoredNumber);
    ////////////////////////////////////////////////////////////////////
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
- (IBAction)enterNumber {
    [_textNumber resignFirstResponder];
    if ([_textNumber.text isEqualToString:@"42"]) {
        _labelFavNumber.text = @"CORRECT!";
    } else {
        _labelFavNumber.text = @"WRONG!";
    }
}
- (IBAction)submitTextNumber:(id)sender {
    [_textNumber resignFirstResponder];
    ixlPlayerProfile *newProfile = [[ixlPlayerProfile alloc]init];
    newProfile.diceRolled = [[NSMutableArray alloc]init];
    NSInteger textNumberText = [_textNumber.text integerValue];
    NSInteger two,three,four,five,six,seven,eight,nine,ten,eleven,twelve;
    two = 2,three = 3,four = 4,five = 5,six = 6,seven = 7,eight = 8,nine = 9,ten = 10,eleven = 11,twelve = 12;
    newProfile.Name = @"Adam";
    newProfile.profileNumber = [NSNumber numberWithInt: 1];
    
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:textNumberText]];
     [newProfile setFavoredNumber];
NSLog(@"Starting favored num = %@",newProfile.printFavoredNumber);
     NSLog(@"derp number %i",textNumberText);
     }
@end
