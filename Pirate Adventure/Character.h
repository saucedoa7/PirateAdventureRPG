//
//  Character.h
//  Pirate Adventure
//
//  Created by Albert Saucedo on 4/6/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Character : NSObject


@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;

@property (nonatomic) int damage;
@property (nonatomic) int health;
@end
