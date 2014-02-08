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
    ixlPlayerProfile *returnProfile;
	NSMutableDictionary *profiles;
    NSMutableArray *playerProfileArray;
	int profileNumTracker;
}
@property (nonatomic,retain)NSMutableDictionary *profiles;
@property (nonatomic,retain)NSMutableArray *playerProfileArray;
@property ixlPlayerProfile *returnProfile;

-(id)init;
-(void) changeFileObject:(ixlPlayerProfile *)playerProfileObject;
//-(ixlPlayerProfile *)new;
//-(ixlPlayerProfile *)current;

@end
