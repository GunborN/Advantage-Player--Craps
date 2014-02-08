//
//  ixlEditFileObject.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 2/7/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "ixlEditFileObject.h"

@implementation ixlEditFileObject
@synthesize profiles,playerProfileArray,returnProfile;

-(id) init
{
    if(self = [super init])
    {
        //self.profiles = [[NSMutableDictionary alloc]init];
    }
    return self;
}

-(void) changeFileObject:(ixlPlayerProfile *)playerProfileObject
{
    //This will set the playerProfileArray to have the updated contents of the plist file
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =  [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"playerProfile.plist"];
    NSLog(@"TESTING1");
    playerProfileArray = [[[NSMutableArray alloc] initWithContentsOfFile:plistPath]mutableCopy];
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:[playerProfileArray count]];
	NSMutableDictionary *dict;
    NSDictionary *object;
    
    // setting all of the objects from the passed array into a temporary array and obtaining the
    // number of profiles in existance.
    profileNumTracker = 0;
    for (object in playerProfileArray)
    {
        NSLog(@"TESTING2");
        if ([[object objectForKey:@"Profile Number"] isEqualToNumber:[NSNumber numberWithInt: profileNumTracker]])
        {
            NSLog(@"TESTING2.5");
            [tempArray insertObject:object atIndex:profileNumTracker];
            NSLog(@"%@",playerProfileArray[profileNumTracker]);
            profileNumTracker++;
            NSLog(@"TESTING3");
        }
    }
    
    profiles = [tempArray objectAtIndex:0];
    
    // if the playerProfileArray only consists of 1 element (which is the base element NOT TO BE MESSED WITH, other than
    // to copy it) then this copies the base/blank profile object, puts in new values in that object, sets object in the
    // playerProfileArray, then writes it to the file
	if(profileNumTracker == 1)
	{
        NSLog(@"TESTING4");
		[tempArray insertObject:profiles atIndex:1];
        dict = [tempArray objectAtIndex:1];
        [dict setObject:[NSNumber numberWithInt:profileNumTracker++] forKey:@"Profile Number"];
        
        if(playerProfileObject.Name == nil || [playerProfileObject.Name  isEqual: @""])
        {
            playerProfileObject.Name = @"Choose-A-Name";
            [dict setObject:playerProfileObject.Name forKey:@"Name"];
        }
        if(playerProfileObject.favoredNumber != nil)
        {
            [dict setObject:playerProfileObject.favoredNumber forKey:@"Favored Number"];
        }
        [dict setObject:playerProfileObject.diceRolled forKey:@"Dice Rolled"];
        [dict setObject:playerProfileObject.rollAverageDictionary forKey:@"Roll Average"];
        NSLog(@"profileNumTracker: %i",profileNumTracker);
        [playerProfileArray insertObject:dict atIndex:(profileNumTracker-1)]; //ObjectAtIndex:(profileNumTracker - 1) withObject:dict];
        [playerProfileArray writeToFile:plistPath atomically:YES];
        
        ////////////This portion can be deleted after testing is done with//////////
        NSLog(@"Document's Directory1: %@",paths[0]);                            ///
        NSLog(@"There are: %i profiles currently made.", (profileNumTracker-1)); ///
        NSLog(@"This is the updated file information after editing the file: "); ///
        NSLog(@"%@",playerProfileArray[(profileNumTracker-1)]);                  ///
        ////////////////////////////////////////////////////////////////////////////
		NSLog(@"TESTING5");
	}else{
        
        bool ifProfileExisted = false;
        NSLog(@"TESTING6");
        // this will go through each object in the playerProfileArray one at a time.
        for(NSDictionary *currentObject in tempArray)
        {
            NSLog(@"TESTING7");
            // if the object in array already exists, simply replace values in the tempArray with updated values and
            // do the same write to file process.
            if([[currentObject objectForKey:@"Profile Number"] isEqualToNumber:playerProfileObject->profileNumber])
            {
                NSLog(@"TESTING8");
                dict = [tempArray objectAtIndex:(int)playerProfileObject->profileNumber] ;
                [dict setObject:playerProfileObject.Name forKey:@"Name"];
                [dict setObject:playerProfileObject.favoredNumber forKey:@"Favored Number"];
                [dict setObject:playerProfileObject.diceRolled forKey:@"Dice Rolled"];
                [dict setObject:playerProfileObject.rollAverageDictionary forKey:@"Roll Average"];
                [playerProfileArray replaceObjectAtIndex:((int)playerProfileObject->profileNumber) withObject:dict];
                [playerProfileArray writeToFile:plistPath atomically:YES];
                
                ////////////This portion can be deleted after testing is done with///////////
                NSLog(@"Document's Directory1: %@",paths[0]);                            ////
                NSLog(@"There are: %i profiles currently made.", (profileNumTracker-1)); ////
                NSLog(@"This is the updated file information after editing the file: "); ////
                NSLog(@"%@",playerProfileArray[((int)playerProfileObject->profileNumber)]);//
                /////////////////////////////////////////////////////////////////////////////
                NSLog(@"TESTING9");
                ifProfileExisted = true;
                break;
            }
        }
        
        // if the profile didn't exist already, this will make a new profile and set it into the tempArray then do same
        // process basically.
        if(ifProfileExisted == false)
        {
            NSLog(@"TESTING10");
            [tempArray insertObject:profiles atIndex:profileNumTracker];
            dict = [tempArray objectAtIndex:profileNumTracker];
            [dict setObject:[NSNumber numberWithInteger:profileNumTracker++] forKey:@"Profile Number"];
            [dict setObject:playerProfileObject.Name forKey:@"Name"];
            [dict setObject:playerProfileObject.favoredNumber forKey:@"Favored Number"];
            [dict setObject:playerProfileObject.diceRolled forKey:@"Dice Rolled"];
            [dict setObject:playerProfileObject.rollAverageDictionary forKey:@"Roll Average"];
            [playerProfileArray replaceObjectAtIndex:(profileNumTracker - 1) withObject:dict];
            [playerProfileArray writeToFile:plistPath atomically:YES];
            NSLog(@"TESTING11");
            ////////////This portion can be deleted after testing is done with//////////
            NSLog(@"Document's Directory1: %@",paths[0]);                            ///
            NSLog(@"There are: %i profiles currently made.", (profileNumTracker-1)); ///
            NSLog(@"This is the updated file information after editing the file: "); ///
            NSLog(@"%@",playerProfileArray[(profileNumTracker-1)]);                  ///
            ////////////////////////////////////////////////////////////////////////////
        }
    }
}


@end
