//
//  playerProfile.h
//  Advantage Player: Craps
//
//  Created by Yevgeniy Rokhlin on 1/29/14.
//  Copyright (c) 2014 IXLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface playerProfile : NSObject

NSString *Name;
NSNumber *profileNumber;
NSMutableArray *diceRolled;
NSNumber *favoredNumber;

@end
