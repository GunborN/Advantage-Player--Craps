//
//  ixlEditFileObject.m
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 2/7/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import "ixlEditFileObject.h"

@implementation ixlEditFileObject
@synthesize profiles,playerProfileArray,paths,documentsDirectory,plistPath,baseProfile;

-(id) init
{
    if(self = [super init])
    {
        self->baseProfile = [[ixlPlayerProfile alloc]init];
        paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDirectory =  [paths objectAtIndex:0];
        plistPath = [documentsDirectory stringByAppendingPathComponent:@"playerProfile.plist"];
    }
    return self;
}

-(void) changeFileObject:(ixlPlayerProfile *)playerProfileObject
{
    //This will set the playerProfileArray to have the updated contents of the plist file
    playerProfileArray = [[[NSMutableArray alloc] initWithContentsOfFile:plistPath]mutableCopy];
    
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:playerProfileArray];
	NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    profileNumTracker = [playerProfileArray count];
    
    // if the playerProfileArray only consists of 1 element (which is the base element NOT TO BE MESSED WITH, other than
    // to copy it) then this copies the base/blank profile object, puts in new values in that object, sets object in the
    // playerProfileArray, then writes it to the file
	if(profileNumTracker == 1)
	{
        profiles = [tempArray objectAtIndex:0];
        
        if([profiles objectForKey:@"Item 0"] == [[tempArray objectAtIndex:0] objectForKey:@"Item 0"])
        {

            NSDictionary *profiles2 = [[[NSDictionary alloc]initWithDictionary:profiles]mutableCopy];
            [tempArray insertObject:profiles2 atIndex:1];
            dict = [tempArray objectAtIndex:1];
            [dict setObject:[NSNumber numberWithInt:profileNumTracker++] forKey:@"Profile Number"];
        
            if(playerProfileObject->name == nil)
            {
                [playerProfileObject setName: @"Choose-A-Name"];
                [dict setObject:playerProfileObject->name forKey:@"Name"];
            }
            
            [dict setObject:playerProfileObject->name forKey:@"Name"];
            
            if(playerProfileObject->favoredNumber == nil)
            {
                [dict setObject:@0 forKey:@"Favored Number"];
            }
            else
                [dict setObject:playerProfileObject->favoredNumber forKey:@"Favored Number"];
            [dict setObject:playerProfileObject->diceRolled forKey:@"Dice Rolled"];
            [dict setObject:playerProfileObject->rollAverageDictionary forKey:@"Roll Average"];
            [playerProfileArray insertObject:dict atIndex:(profileNumTracker-1)];
            [playerProfileArray writeToFile:plistPath atomically:YES];
        }

	}else{
        bool ifProfileExisted = false;

        // this will go through each object in the playerProfileArray one at a time.
        for(NSDictionary *currentObject in tempArray)
        {
            // if the object in array already exists, simply replace values in the tempArray with updated values and
            // do the same write to file process.
            if([[currentObject objectForKey:@"Profile Number"] isEqualToNumber:playerProfileObject->profileNumber])
            {
                dict = [tempArray objectAtIndex: [playerProfileObject->profileNumber intValue]];
                [dict setObject:playerProfileObject->name forKey:@"Name"];
                
                if(playerProfileObject->favoredNumber == nil)
                {
                    [dict setObject:@0 forKey:@"Favored Number"];
                }else
                    [dict setObject:playerProfileObject->favoredNumber forKey:@"Favored Number"];
                [dict setObject:playerProfileObject->diceRolled forKey:@"Dice Rolled"];
                [dict setObject:playerProfileObject->rollAverageDictionary forKey:@"Roll Average"];
                [playerProfileArray replaceObjectAtIndex:[playerProfileObject->profileNumber intValue] withObject:dict];
                [playerProfileArray writeToFile:plistPath atomically:YES];

                ifProfileExisted = true;
                break;
            }
        }
        // if the profile didn't exist already, this will make a new profile and set it into the tempArray then do same
        // process basically.
        if(ifProfileExisted == false)
        {
            NSDictionary *profiles2 = [[[NSDictionary alloc]initWithDictionary:profiles]mutableCopy];
            [tempArray insertObject:profiles2 atIndex:profileNumTracker];
            dict = [tempArray objectAtIndex:profileNumTracker];
            
            [dict setObject:[NSNumber numberWithInt:profileNumTracker++] forKey:@"Profile Number"];
            [dict setObject:playerProfileObject->name forKey:@"Name"];
            
            if(playerProfileObject->favoredNumber != nil)
            {
                [dict setObject:@0 forKey:@"Favored Number"];
            }
            else
                [dict setObject:playerProfileObject->favoredNumber forKey:@"Favored Number"];
            [dict setObject:playerProfileObject->diceRolled forKey:@"Dice Rolled"];
            [dict setObject:playerProfileObject->rollAverageDictionary forKey:@"Roll Average"];
            [playerProfileArray insertObject: dict atIndex:(profileNumTracker-1)];
            [playerProfileArray writeToFile:plistPath atomically:YES];
        }
    }
}

-(NSMutableArray *)obtainProfileList
{
    ixlPlayerProfile *currentProfile = [[ixlPlayerProfile alloc]init];
    profileNumTracker = [playerProfileArray count];
    NSMutableArray *listOfProfiles = [[NSMutableArray alloc]init];
    NSDictionary *profiles3 = [[[NSDictionary alloc]initWithDictionary:playerProfileArray[0]]mutableCopy];

    //Setting the base profile to be copied from the base plist file "Item 0"
    baseProfile->profileNumber = [profiles3 objectForKey:@"Profile Number"];
    baseProfile->name = [profiles3 objectForKey:@"Name"];
    baseProfile->favoredNumber = [profiles3 objectForKey:@"Favored Number"];
    baseProfile->diceRolled = [profiles3 objectForKey:@"Dice Rolled"];
    baseProfile->rollAverageDictionary = [profiles3 objectForKey:@"Roll Average"];

    currentProfile = baseProfile;
    
    //this will go through each object in the plist file and assign them to a new ixlPlayerProfile object, then putting that
    //object inside of an array in order from Profile Number 1 onwards for however many profiles exist.
    for(int i = 1;i < profileNumTracker;i++)
    {
        ixlPlayerProfile *currentProfile = [[ixlPlayerProfile alloc]init];
        NSDictionary *profiles3 = [[[NSDictionary alloc]initWithDictionary:playerProfileArray[i]]mutableCopy];

        currentProfile->profileNumber = [profiles3 objectForKey:@"Profile Number"];
        currentProfile->name = [profiles3 objectForKey:@"Name"];
        currentProfile->favoredNumber = [profiles3 objectForKey:@"Favored Number"];
        currentProfile->diceRolled = [profiles3 objectForKey:@"Dice Rolled"];
        currentProfile->rollAverageDictionary = [profiles3 objectForKey:@"Roll Average"];
        
        listOfProfiles[i-1] = currentProfile;
    }
    return listOfProfiles;
}

@end
