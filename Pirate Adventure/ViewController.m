//
//  ViewController.m
//  Pirate Adventure
//
//  Created by Albert Saucedo on 4/4/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "TIle.h"
#import "Character.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Factory *factory = [Factory new];

    // Creating Character && Boss instances from Factory class.
    self.character = [factory character];
    self.boss = [factory boss];
    self.tiles = [factory tiles];

    self.currentPoint = CGPointMake(0, 0); // X Range 0,1,2,3 && Y Range 0,1,2

    [self updateCharacterStatsForArmor:nil
                            withWeapon:nil
                      withHealthEffect:0];
    
    [self updateTile];
    [self upDateButtons];
}


- (IBAction)btnActionPressed:(UIButton *)sender {
    TIle * tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];

    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }

    if (self.character.health <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"DEAD"
                                                        message:@"You died"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];

    } else if (self.boss.health <= 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You won!"
                                                        message:@"The boss is dead"
                                                       delegate:nil
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }

    [self updateCharacterStatsForArmor:tile.armor
                            withWeapon:tile.weapon
                      withHealthEffect:tile.healthEffect];

    [self updateTile];
}

#pragma mark IBActions

- (IBAction)btnWestPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x -1, self.currentPoint.y);
    [self upDateButtons];
    [self updateTile];
}
- (IBAction)btnEastPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x +1, self.currentPoint.y);
    [self upDateButtons];
    [self updateTile];

}
- (IBAction)btnNorthPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1);
    [self upDateButtons];
    [self updateTile];

}
- (IBAction)btnSouthPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y -1);
    [self upDateButtons];
    [self updateTile];

}

- (IBAction)resetGame:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;

    [self viewDidLoad];
}

#pragma mark Helper Methods

- (void)updateTile{
    TIle *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    NSLog(@"X %.2f Y %.2f", self.currentPoint.x, self.currentPoint.y);

    self.lblStory.text = tileModel.story;
    NSLog(@"%@", self.lblStory.text);

    self.lblHealth.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.lblDamage.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.lblWeapon.text = self.character.weapon.name;
    NSLog(@"Weapon %@", self.character.weapon);
    self.lblArmor.text = self.character.armor.name;

    [self.btnAction setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

-(void)upDateButtons{
    self.btnWest.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    self.btnEast.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.btnNorth.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
    self.btnSouth.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y -1)];

}

-(BOOL)tileExistAtPoint:(CGPoint)point{

    //The count of the total number of arrays in our tiles array is greater than our x point.
    //We also need to confirm that for the chosen array inside of our tiles array that its' count is greater than the y point
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    } else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(Armor *)armor
                         withWeapon:(Weapon *)weapon
                   withHealthEffect:(int)healthEffect{

    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    } else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    } else if (healthEffect != 0) {
        self.character.health = self.character.health + healthEffect;
    } else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }

}
@end
