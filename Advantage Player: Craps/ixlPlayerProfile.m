//
//  ixlPlayerProfile.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/29/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "ixlPlayerProfile.h"

@implementation ixlPlayerProfile
@synthesize Name,profileNumber,diceRolled;

-(void) setFavoredNumber
{
	NSNumber *leadRoll;
	int leadRollAmount = 0, count = 0;
	NSArray *diceRolledCopy = [[NSMutableArray alloc]initWithCapacity:[diceRolled count]];
    diceRolledCopy = diceRolled;
    NSNumber *current;

	for(int i = 2; i <= 12;i++)
	{
        current = [NSNumber numberWithInteger:i];
        
		// this block should give me an array with just the “current” roll number objects in it
		NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"SELF == %@",current];/*[NSString stringWithFormat:@"SELF == %@", current]];*/
  		diceRolledCopy = [diceRolled filteredArrayUsingPredicate:thePredicate];
        
		// this block should take the size of the new array of “current” objects and give us back
		// an integer value that we can compare to the leadRollAmount, thus determining
		// whether or not the leadRoll should be changed to the “current” object or not.
		count = [diceRolledCopy count];
		if(count > leadRollAmount)
		{
			leadRoll = current;
			leadRollAmount = count;
		}
	}
	favoredNumber = leadRoll;
}

-(NSNumber *) printFavoredNumber
{
	//print out the variable “favoredNumber” to wherever.
    return favoredNumber;
}

@end