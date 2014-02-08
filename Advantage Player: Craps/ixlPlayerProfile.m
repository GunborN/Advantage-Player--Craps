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

    // This big block sets objects in a dictionary I can gain access to by using reference keys
    [rollAverageDictionary setObject:@((totalTwos/totalNum)*100) forKey :@"2"];
    [rollAverageDictionary setObject:@((totalThrees/totalNum)*100) forKey :@"3"];
    [rollAverageDictionary setObject:@((totalFours/totalNum)*100) forKey :@"4"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"HW 4"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"EW 4"];
    [rollAverageDictionary setObject:@((totalFives/totalNum)*100) forKey :@"5"];
    [rollAverageDictionary setObject:@((totalSixes/totalNum)*100) forKey :@"6"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"HW 6"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"EW 6"];
    [rollAverageDictionary setObject:@((totalSevens/totalNum)*100)forKey :@"7"];
    [rollAverageDictionary setObject:@((totalEights/totalNum)*100) forKey :@"8"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"HW 8"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"EW 8"];
    [rollAverageDictionary setObject:@((totalNines/totalNum)*100) forKey :@"9"];
    [rollAverageDictionary setObject:@((totalTens/totalNum)*100) forKey :@"10"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"HW 10"];
    //[rollAverageDictionary setObject:@0.0f forKey :@"EW 10"];
    [rollAverageDictionary setObject:@((totalElevens/totalNum)*100) forKey :@"11"];
    [rollAverageDictionary setObject:@((totalTwelves/totalNum)*100) forKey :@"12"];
    
    //this will set the favoredNumber to the most commonly picked number
	favoredNumber = leadRoll;
}


@end