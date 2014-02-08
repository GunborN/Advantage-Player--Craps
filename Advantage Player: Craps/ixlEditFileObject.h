//
//  ixlEditFileObject.h
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 2/7/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ixlPlayerProfile.h"

@interface ixlEditFileObject : ixlPlayerProfile
{
    ixlPlayerProfile *baseProfile;
	NSDictionary *profiles;
    NSMutableArray *playerProfileArray;
	int profileNumTracker;
    
    NSArray *paths;
    NSString *documentsDirectory,*plistPath;
}
@property (nonatomic,retain)NSDictionary *profiles;
@property (nonatomic,retain)NSMutableArray *playerProfileArray;
@property NSArray *paths;
@property NSString *documentsDirectory,*plistPath;
@property ixlPlayerProfile *baseProfile;

-(id)init;
-(void) changeFileObject:(ixlPlayerProfile *)playerProfileObject;
-(NSMutableArray *)obtainProfileList;


@end
