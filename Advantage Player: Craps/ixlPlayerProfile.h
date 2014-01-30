//
//  ixlPlayerProfile.h
//  Advantage Player: Craps
//
//  Created by Adam Mitchell on 1/29/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ixlPlayerProfile : NSObject
{
    NSString *Name;
    NSNumber *profileNumber,*favoredNumber;
    NSMutableArray *diceRolled;
}
@property NSString *Name;
@property NSNumber *profileNumber;
@property (nonatomic,retain) NSMutableArray *diceRolled;

-(void)setFavoredNumber;
-(NSNumber *)printFavoredNumber;

@end