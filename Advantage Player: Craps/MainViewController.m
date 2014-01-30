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
    
    
    /////////////testing stuff -- DELETE EXTRAS BEFORE FINALIZING//////////////
    newProfile = [[ixlPlayerProfile alloc]init];// Keep this
    newProfile.diceRolled = [[NSMutableArray alloc]init];// Keep this
    newProfile.rollAverageDictionary = [NSMutableDictionary dictionary];// Keep this
    
    //rest can be deleted or commented
    NSInteger two,three,four,five,six,seven,eight,nine,ten,eleven,twelve;
    two = 2,three = 3,four = 4,five = 5,six = 6,seven = 7,eight = 8,nine = 9,ten = 10,eleven = 11,twelve = 12;
    newProfile.Name = @"Adam";
    newProfile.profileNumber = [NSNumber numberWithInt: 1];
    NSLog(@"Starting favored num = %@",newProfile.printFavoredNumber);
    

    
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

- (IBAction)submitTextNumber:(id)sender {
    
    //converts favoredNumber in to string
    NSString *favNumber = [newProfile.printFavoredNumber stringValue];
    //converts input text to NSNumber
    NSInteger textNumberText = [_textNumber.text integerValue];
    
    //adds an object from input text to the array newProfile
    if (textNumberText >= 2 && textNumberText <= 12){
    [newProfile.diceRolled addObject:[NSNumber numberWithInteger:textNumberText]];
    }
    else{
    _textNumber.text = @"";
        NSLog(@"Invalid number!!");
        return;
    }
    //converts NSMutable Array in to NSString seperated by ","
    NSString *stringArray = [newProfile.diceRolled componentsJoinedByString:@","];

    //closes keyboard dialog
    [_textNumber resignFirstResponder];
    
    [newProfile setFavoredNumber];
    
    //sets labels
    _currentArray.text = stringArray;
    _labelFavNumber.text = favNumber;
    
    //for now, this just outputs to the console percentages of the rolls contained in the arrray.
    NSLog(@"   Two:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"2"]);
    NSLog(@" Three:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"3"]);
    NSLog(@"  Four:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"4"]);
    NSLog(@"  Five:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"5"]);
    NSLog(@"   Six:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"6"]);
    NSLog(@" Seven:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"7"]);
    NSLog(@" Eight:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"8"]);
    NSLog(@"  Nine:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"9"]);
    NSLog(@"   Ten:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"10"]);
    NSLog(@"Eleven:  %%%@", [newProfile.rollAverageDictionary objectForKey:@"11"]);
    NSLog(@"Twelve:  %%%@\n\n",[newProfile.rollAverageDictionary objectForKey:@"12"]);
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

@end
