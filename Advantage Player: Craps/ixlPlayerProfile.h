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
    NSString *name;
    NSNumber *favoredNumber,*profileNumber;
    NSMutableArray *diceRolled;
    NSMutableDictionary *rollAverageDictionary;
}
@property NSString *name;
@property NSNumber *favoredNumber,*profileNumber;
@property (nonatomic,retain) NSMutableArray *diceRolled;
@property (nonatomic,retain) NSMutableDictionary *rollAverageDictionary;

//-(id)initWithCurrent: (ixlEditFileObject *)currentObj;
//-(id)initWithNew: (ixlEditFileObject *)newObj;
-(id)init;
-(void)setFavoredNumber;

@end