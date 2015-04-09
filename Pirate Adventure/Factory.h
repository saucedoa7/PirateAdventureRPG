//
//  Factory.h
//  Pirate Adventure
//
//  Created by Albert Saucedo on 4/5/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Boss.h"

@interface Factory : NSObject
-(NSArray *)tiles;
-(Character *)character;
-(Boss *)boss;
@end
