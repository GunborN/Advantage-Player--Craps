//
//  MainViewController.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/23/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import <Foundation/NSArray.h>

NSNumber *favoredNum;

@implementation MainViewController
@synthesize ixlEditProfile,ixlNewProfile;

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
    
    
    
    ixlEditProfile = [[ixlEditFileObject alloc]init];//keep this
    ixlNewProfile = [[ixlPlayerProfile alloc]init];// Keep this
    
    
    /////////////testing stuff -- DELETE EXTRAS BEFORE FINALIZING//////////////
    //rest can be deleted or commented
    NSInteger two,three,four,five,six,seven,eight,nine,ten,eleven,twelve;
    two = 2,three = 3,four = 4,five = 5,six = 6,seven = 7,eight = 8,nine = 9,ten = 10,eleven = 11,twelve = 12;
    ixlNewProfile.Name = @"Adam";
    ////////////////////////////////////////////////////////////////////
    
    /*
    /////////////LOG and EDIT button functionality//////////////////////
    //Create array from Plist document of all player profiles
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"playerProfile.plist"];
    
    //This will store all of the player profiles into the "playerProfileArray" as
    //dictionaries
    playerProfileArray = [[[NSMutableArray alloc]initWithContentsOfFile:plistPath]mutableCopy];
    */
    ////////////////////////////////////////////////////////////////////
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)submitTextNumber:(id)sender {
    
    //converts favoredNumber in to string
    NSString *favNumber = [ixlNewProfile.favoredNumber stringValue];
    //converts input text to NSNumber
    NSInteger textNumberText = [_textNumber.text integerValue];
    
    //adds an object from input text to the array ixlNewProfile
    if (textNumberText >= 2 && textNumberText <= 12){
        [ixlNewProfile.diceRolled addObject:[NSNumber numberWithInteger:textNumberText]];
    }
    else{
    _textNumber.text = @"";
        NSLog(@"Invalid number!!");
        return;
    }
    //converts NSMutable Array in to NSString seperated by ","
    NSString *stringArray = [ixlNewProfile.diceRolled componentsJoinedByString:@","];

    //closes keyboard dialog
    [_textNumber resignFirstResponder];
    
    [ixlNewProfile setFavoredNumber];
    
    favoredNum = ixlNewProfile.favoredNumber;
    
    //sets labels
    _currentArray.text = stringArray;
    _labelFavNumber.text = favNumber;
    
    //for now, this just outputs to the console percentages of the rolls contained in the arrray.
    NSLog(@"   Two:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"2"]);
    NSLog(@" Three:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"3"]);
    NSLog(@"  Four:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"4"]);
    NSLog(@"  Five:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"5"]);
    NSLog(@"   Six:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"6"]);
    NSLog(@" Seven:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"7"]);
    NSLog(@" Eight:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"8"]);
    NSLog(@"  Nine:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"9"]);
    NSLog(@"   Ten:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"10"]);
    NSLog(@"Eleven:  %%%@", [ixlNewProfile.rollAverageDictionary objectForKey:@"11"]);
    NSLog(@"Twelve:  %%%@\n\n",[ixlNewProfile.rollAverageDictionary objectForKey:@"12"]);
}

//clears the text field when editing of text field begins
- (IBAction)clearTextField:(UITextField *)sender {
    _textNumber.text = @"";
}

//closes keyboard when editing is done or when textfield loses focus
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)editDictionary:(id)sender {
    
    ixlNewProfile.Name = @"Adam Mitchell";
    ixlNewProfile.favoredNumber = favoredNum;
    ixlNewProfile.profileNumber = @1;
    [ixlEditProfile changeFileObject:ixlNewProfile];
    ixlNewProfile.Name = @"Crack TheJack";
    ixlNewProfile.favoredNumber = favoredNum;
    ixlNewProfile.profileNumber = @2;
    [ixlEditProfile changeFileObject:ixlNewProfile];
    ixlNewProfile.Name = @"War TheChild";
    ixlNewProfile.favoredNumber = favoredNum;
    ixlNewProfile.profileNumber = @3;
    [ixlEditProfile changeFileObject:ixlNewProfile];
    //[self updatePlist]; //needed for below method
}

/*
 -(void)refreshArray
 {
 //creates an array from Plist document of all player profiles
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 NSString *documentsDirectory =  [paths objectAtIndex:0];
 NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"playerProfile.plist"];
 playerProfileArray = [[[NSMutableArray alloc] initWithContentsOfFile:plistPath]mutableCopy];
 NSLog(@"%@", [playerProfileArray objectAtIndex:0]);
 }

//method to retrieve mountain object and update Plist
-(void)updatePlist
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (NSDictionary *object in playerProfileArray)
    {
        if ([[object objectForKey:@"Profile"] isEqualToString:@"0"])
        {
            [tempArray insertObject:object atIndex:0];
        }
    }
    NSMutableDictionary *dict = [tempArray objectAtIndex:0];
    
    //edit below this line then use LOG and EDIT buttons///////
    [dict setObject:favoredNum forKey:@"Favored Number"];
    //don't edit past here for testing purposes////////////////
    
    [playerProfileArray replaceObjectAtIndex:0 withObject:dict];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"Document's Directory1: %@",paths[0]);
    NSString *documentsDirectory =  [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"playerProfile.plist"];
    [playerProfileArray writeToFile:path atomically:YES];
}
*/

@end
