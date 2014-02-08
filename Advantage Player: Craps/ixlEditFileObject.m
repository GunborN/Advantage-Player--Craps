//
//  ixlEditFileObject.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 2/7/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "ixlEditFileObject.h"

@implementation ixlEditFileObject
@synthesize profiles,playerProfileArray;//,returnProfile;

-(id) init
{
    if(self = [super init])
    {
        //self.returnProfile = [[ixlPlayerProfile alloc]init];
        self.profiles = [[NSMutableDictionary alloc]init];
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
    
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:playerProfileArray];
	NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    profileNumTracker = [playerProfileArray count];
    
    profiles = [tempArray objectAtIndex:0];
    
    // if the playerProfileArray only consists of 1 element (which is the base element NOT TO BE MESSED WITH, other than
    // to copy it) then this copies the base/blank profile object, puts in new values in that object, sets object in the
    // playerProfileArray, then writes it to the file
	if(profileNumTracker == 1)
	{

		[tempArray insertObject:profiles atIndex:1];
        dict = [tempArray objectAtIndex:1];
        [dict setObject:[NSNumber numberWithInt:profileNumTracker++] forKey:@"Profile Number"];
        
        if(playerProfileObject->name == nil || [playerProfileObject->name isEqualToString:@""])
        {
            [playerProfileObject setName: @"Choose-A-Name"];
            [dict setObject:playerProfileObject->name forKey:@"Name"];
        }
        if(playerProfileObject->favoredNumber != nil)
        {
            [dict setObject:playerProfileObject->favoredNumber forKey:@"Favored Number"];
        }
        [dict setObject:playerProfileObject->diceRolled forKey:@"Dice Rolled"];
        [dict setObject:playerProfileObject->rollAverageDictionary forKey:@"Roll Average"];
        NSLog(@"profileNumTracker: %i",profileNumTracker);
        //[playerProfileArray replaceObjectAtIndex:0 withObject:profiles];
        [playerProfileArray insertObject:dict atIndex:(profileNumTracker-1)]; //ObjectAtIndex:(profileNumTracker - 1) withObject:dict];
        [playerProfileArray writeToFile:plistPath atomically:YES];
        
        ////////////This portion can be deleted after testing is done with//////////
        NSLog(@"Document's Directory1: %@",paths[0]);                            ///
        NSLog(@"There are: %i profiles currently made.", (profileNumTracker-1)); ///
        NSLog(@"This is the updated file information after editing the file: "); ///
        NSLog(@"%@",playerProfileArray[(profileNumTracker-1)]);                  ///
        ////////////////////////////////////////////////////////////////////////////

	}else{
        
        bool ifProfileExisted = false;

        // this will go through each object in the playerProfileArray one at a time.
        for(NSDictionary *currentObject in tempArray)
        {

            // if the object in array already exists, simply replace values in the tempArray with updated values and
            // do the same write to file process.
            if([[currentObject objectForKey:@"Profile Number"] isEqualToNumber:playerProfileObject->profileNumber])
            {

                dict = [tempArray objectAtIndex:(int)playerProfileObject->profileNumber] ;
                [dict setObject:playerProfileObject->name forKey:@"Name"];
                [dict setObject:playerProfileObject->favoredNumber forKey:@"Favored Number"];
                [dict setObject:playerProfileObject->diceRolled forKey:@"Dice Rolled"];
                [dict setObject:playerProfileObject->rollAverageDictionary forKey:@"Roll Average"];
                [playerProfileArray replaceObjectAtIndex:((int)playerProfileObject->profileNumber) withObject:dict];
                [playerProfileArray writeToFile:plistPath atomically:YES];
                
                ////////////This portion can be deleted after testing is done with///////////
                NSLog(@"Document's Directory1: %@",paths[0]);                            ////
                NSLog(@"There are: %i profiles currently made.", (profileNumTracker-1)); ////
                NSLog(@"This is the updated file information after editing the file: "); ////
                NSLog(@"%@",playerProfileArray[((int)playerProfileObject->profileNumber)]);//
                /////////////////////////////////////////////////////////////////////////////

                ifProfileExisted = true;
                break;
            }
        }
        
        // if the profile didn't exist already, this will make a new profile and set it into the tempArray then do same
        // process basically.
        if(ifProfileExisted == false)
        {
            [tempArray insertObject:profiles atIndex:profileNumTracker];
            dict = [tempArray objectAtIndex:profileNumTracker];
            [dict setObject:[NSNumber numberWithInt:profileNumTracker++] forKey:@"Profile Number"];
            [dict setObject:playerProfileObject->name forKey:@"Name"];
            [dict setObject:playerProfileObject->favoredNumber forKey:@"Favored Number"];
            [dict setObject:playerProfileObject->diceRolled forKey:@"Dice Rolled"];
            [dict setObject:playerProfileObject->rollAverageDictionary forKey:@"Roll Average"];
            [playerProfileArray insertObject: dict atIndex:(profileNumTracker-1)];
            [playerProfileArray writeToFile:plistPath atomically:YES];
            
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
