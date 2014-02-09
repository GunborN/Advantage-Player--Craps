//
//  ixlPlayerProfile.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/29/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "ixlPlayerProfile.h"
#import "ixlEditFileObject.h"


@implementation ixlPlayerProfile
@synthesize name,favoredNumber,profileNumber,diceRolled,rollAverageDictionary;
/*
-(id)initWithCurrent: (ixlEditFileObject *)currentObj
{
    return self;
}

-(id) initWithNew : (ixlEditFileObject *)newObj
{
    return [self initWithCurrent:nil];
}
*/
-(id) init
{
    if(self = [super init])
    {
        self.name = @"Player";
        self.diceRolled = [[NSMutableArray alloc]init];
        self.rollAverageDictionary = [[NSMutableDictionary alloc]init];
        //return [self initWithNew:nil];
    }
    return self;
}

-(void) setFavoredNumber
{
    int totalTwos = 0, totalThrees = 0, totalFours = 0, totalFives = 0, totalSixes = 0, totalSevens = 0,
        totalEights = 0, totalNines = 0, totalTens = 0,totalElevens = 0, totalTwelves = 0;
    float totalNum = 0;
    
    NSNumber *leadRoll;
	int leadRollAmount = 0, count = 0;
	NSArray *diceRolledCopy = [[NSMutableArray alloc]initWithCapacity:[diceRolled count]];
    diceRolledCopy = diceRolled;
    NSNumber *current;

	for(int i = 2; i <= 12;i++)
	{
        current = [NSNumber numberWithInteger:i];
        
		// this block should give me an array with just the “current” roll number objects in it
		NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"SELF == %@",current];
  		diceRolledCopy = [diceRolled filteredArrayUsingPredicate:thePredicate];
        
		// this block should take the size of the new array of “current” objects and give us back
		// an integer value that we can compare to the leadRollAmount, thus determining
		// whether or not the leadRoll should be changed to the “current” object or not.
		count = [diceRolledCopy count];
		if(count > leadRollAmount)
		{
			leadRoll = current;
			leadRollAmount = count;
            favoredNumber = leadRoll;
		}
        
        //swith statement that takes values 2-12 (for now) in order to calculate the percentages each number has currently been rolled.
        switch (i) {
            case 2:
                totalTwos = count;
                totalNum += count;
                break;
            case 3:
                totalThrees = count;
                totalNum += count;
                break;
            case 4:
                totalFours = count;
                totalNum += count;
                break;
            case 5:
                totalFives = count;
                totalNum += count;
                break;
            case 6:
                totalSixes = count;
                totalNum += count;
                break;
            case 7:
                totalSevens = count;
                totalNum += count;
                break;
            case 8:
                totalEights = count;
                totalNum += count;
                break;
            case 9:
                totalNines = count;
                totalNum += count;
                break;
            case 10:
                totalTens = count;
                totalNum += count;
                break;
            case 11:
                totalElevens = count;
                totalNum += count;
                break;
            case 12:
                totalTwelves = count;
                totalNum += count;
                break;
            default:
                break;
        }
	}
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterRoundDown;

    // This big block sets objects in a dictionary I can gain access to by using reference keys
    [self format:@((totalTwos/totalNum)*100):@"2":formatter];
    [self format:@((totalThrees/totalNum)*100):@"3":formatter];
    [self format:@((totalFours/totalNum)*100):@"4":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"HW 4":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"EW 4":formatter];
    [self format:@((totalFives/totalNum)*100):@"5":formatter];
    [self format:@((totalSixes/totalNum)*100):@"6":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"HW 6":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"EW 6":formatter];
    [self format:@((totalSevens/totalNum)*100):@"7":formatter];
    [self format:@((totalEights/totalNum)*100):@"8":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"HW 8":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"EW 8":formatter];
    [self format:@((totalNines/totalNum)*100):@"9":formatter];
    [self format:@((totalTens/totalNum)*100):@"10":formatter];
    //[self format:@((totalTens/totalNum)*100):@"HW 10":formatter];
    //[self format:@((totalThrees/totalNum)*100):@"EW 10":formatter];
    [self format:@((totalElevens/totalNum)*100):@"11":formatter];
    [self format:@((totalTwelves/totalNum)*100):@"12":formatter];
    
    //this will set the favoredNumber to the most commonly picked number
	favoredNumber = leadRoll;
}

-(void)format: (NSNumber *)inFormat : (NSString *)key :(NSNumberFormatter *)formatter
{
    NSString *string = [formatter stringFromNumber:inFormat];
    NSNumber *num = [formatter numberFromString:string];
    [rollAverageDictionary setObject:num forKey :key];
}

@end