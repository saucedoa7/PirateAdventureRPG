//
//  TIle.h
//  Pirate Adventure
//
//  Created by Albert Saucedo on 4/4/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> //UIImage Class is in UIKit
#import "Armor.h"
#import "Weapon.h"

@interface TIle : NSObject
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *actionButtonName;
@property (nonatomic, strong) UIImage *backGroundImage;

@property (nonatomic,strong) Armor *armor;
@property (nonatomic, strong) Weapon *weapon;

@property (nonatomic) int healthEffect;

@end
