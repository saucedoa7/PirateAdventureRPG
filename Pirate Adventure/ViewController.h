//
//  ViewController.h
//  Pirate Adventure
//
//  Created by Albert Saucedo on 4/4/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"
#import "Boss.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;

@property (strong, nonatomic) IBOutlet UILabel *lblHealth;
@property (strong, nonatomic) IBOutlet UILabel *lblDamage;
@property (strong, nonatomic) IBOutlet UILabel *lblWeapon;
@property (strong, nonatomic) IBOutlet UILabel *lblArmor;
@property (strong, nonatomic) IBOutlet UILabel *lblStory;
@property (strong, nonatomic) IBOutlet UIButton *btnAction;

@property (strong, nonatomic) IBOutlet UIButton *btnNorth;
@property (strong, nonatomic) IBOutlet UIButton *btnWest;
@property (strong, nonatomic) IBOutlet UIButton *btnEast;
@property (strong, nonatomic) IBOutlet UIButton *btnSouth;


#pragma mark IBActions
- (IBAction)btnActionPressed:(UIButton *)sender;
- (IBAction)btnWestPressed:(UIButton *)sender;
- (IBAction)btnEastPressed:(UIButton *)sender;
- (IBAction)btnNorthPressed:(UIButton *)sender;
- (IBAction)btnSouthPressed:(UIButton *)sender;
- (IBAction)resetGame:(UIButton *)sender;


#pragma Primative Variables

@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) Character *character;
@property (strong, nonatomic) Boss *boss;

@end

