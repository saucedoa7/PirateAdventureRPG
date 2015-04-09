//
//  Factory.m
//  Pirate Adventure
//
//  Created by Albert Saucedo on 4/5/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "Factory.h"
#import "TIle.h"
@implementation Factory
-(NSArray *)tiles{

#pragma mark Tile 1
    TIle *tile1 = [TIle new];
    tile1.story = @"1. Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword?";

    Weapon *bluntSward = [Weapon new];
    bluntSward.name = @"Blunt Round";
    bluntSward.damage = 12;
    tile1.weapon = bluntSward;

    tile1.actionButtonName = @"Take Sword";

#pragma mark Tile 2
    TIle *tile2 = [TIle new];
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";

    Armor *steelArmor = [Armor new];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;

    tile2.actionButtonName = @"Take Armor";

#pragma mark Tile 3
    TIle *tile3 = [TIle new];
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.healthEffect = 12;

    tile3.actionButtonName = @"Stop at the dock";

    NSMutableArray *columnOne = [[NSMutableArray alloc] initWithObjects:tile1,tile2,tile3,nil];

#pragma mark Tile 4
    TIle *tile4 = [TIle new];
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";

    Armor *parrotArmor = [Armor new];
    parrotArmor.name = @"Parrot Armor";
    parrotArmor.health = 20;
    tile4.armor = parrotArmor;

    tile4.actionButtonName = @"Adopt Parrot";

#pragma mark Tile 5
    TIle *tile5 = [TIle new];
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    Weapon *weapon = [Weapon new];
    weapon.name = @"Pistol";
    weapon.damage = 12;
    tile5.weapon = weapon;

    tile5.actionButtonName = @"Upgrade Pistol";

#pragma mark Tile 6
    TIle *tile6 = [TIle new];
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.healthEffect = -22;

    tile6.actionButtonName = @"Show ne fear!";

    NSMutableArray *columnTwo = [[NSMutableArray alloc] initWithObjects:tile4,tile5,tile6,nil];

#pragma mark Tile 7
    TIle *tile7 = [TIle new];
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.healthEffect = -15;

    tile7.actionButtonName = @"Fight those Scum!!";

#pragma mark Tile 8
    TIle *tile8 = [TIle new];
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.healthEffect = -46;

    tile8.actionButtonName =@"Abandon Ship!";

#pragma mark Tile 9
    TIle *tile9 = [TIle new];
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.healthEffect = 20;

    tile9.actionButtonName = @"Take Treasure";

    NSMutableArray *columnThree = [[NSMutableArray alloc] initWithObjects:tile7,tile8,tile9,nil];

#pragma mark Tile 10
    TIle *tile10 = [TIle new];
    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.healthEffect = 15;

    tile10.actionButtonName= @"Repel the invaders";

#pragma mark Tile 11
    TIle *tile11 = [TIle new];
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.healthEffect = -7;

    tile11.actionButtonName = @"Swim deeper";

#pragma mark Tile 12
    TIle *tile12 = [TIle new];
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.healthEffect = -15;

    tile12.actionButtonName = @"Fight";

    NSMutableArray *ColumnFour = [[NSMutableArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    NSArray *allTiles = [[NSArray alloc] initWithObjects:columnOne,columnTwo,columnThree,ColumnFour,nil];

    return allTiles;
}

-(Character *)character{

    Armor *armor = [Armor new];
    armor.name = @"Cloak";
    armor.health = 5;

    Character *character = [Character new];
    character.health = 100;
    character.armor = armor;

    Weapon *weapon =[Weapon new];
    weapon.name = @"Fist";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(Boss *)boss{
    Boss *boss = [Boss new];
    boss.health = 60;
    
    return boss;
}
@end
