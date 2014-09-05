//
//  LDFactory.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/15/14.
//
//

#import "LDFactory.h"

@implementation LDFactory

-(NSArray *)createTileSet
{

    NSArray *tiles = [[NSArray alloc] initWithObjects:
            
        [[NSArray alloc] initWithObjects:
             [self createTile:@"You have arrived at the start of your adventure. Which direction will you go?" backgroundImage:@"PirateStart.jpg" actionButtonTitle:0 healthEffect:0 armor:nil weapon:nil],
             [self createTile:@"Blacksmith" backgroundImage:@"PirateBlacksmith.jpeg" actionButtonTitle:@"Pick up chest plate" healthEffect:0 armor:nil weapon:nil],
             [self createTile:@"Weapons" backgroundImage:@"PirateWeapons.jpeg" actionButtonTitle:@"Pick up sword" healthEffect:0 armor:nil weapon:[self createWeapon:@"Blunt sword" damage:20]],
             nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTile:@"Dock" backgroundImage:@"PirateFriendlyDock.jpg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
            [self createTile:@"Attack" backgroundImage:@"PirateAttack.jpg" actionButtonTitle:@"Fight back against pirates" healthEffect:-40 armor:nil weapon:nil],
            [self createTile:@"Ship Battle" backgroundImage:@"PirateShipBattle.jpeg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
            nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTile:@"Octopus" backgroundImage:@"PirateOctopusAttack.jpg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
            [self createTile:@"Boss" backgroundImage:@"PirateBoss.jpeg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
            [self createTile:@"Plank" backgroundImage:@"PiratePlank.jpg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
            nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTile:@"Treasure!" backgroundImage:@"PirateTreasure.jpeg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
         [self createTile:@"Parrot" backgroundImage:@"PirateParrot.jpg" actionButtonTitle:@"Give Polly a cracker" healthEffect:0 armor:[self createArmor:@"Lucky Parrot" health:50] weapon:nil],
            [self createTile:@"Treasure" backgroundImage:@"PirateTreasurer2.jpeg" actionButtonTitle:@"" healthEffect:0 armor:nil weapon:nil],
            nil],
            
        nil];
    
    return tiles;

}

-(LDTile *)createTile:(NSString *)story backgroundImage:(NSString *)backgroundImageFile actionButtonTitle:(NSString *)actionButtonTitleText healthEffect:(int)amount armor:(LDArmor *)armorObject weapon:(LDWeapon *)weaponObject
{
    LDTile *tile = [[LDTile alloc] init];
    tile.story = story;
    tile.backgroundImage = [UIImage imageNamed:backgroundImageFile];
    tile.actionButtonTitle = actionButtonTitleText;
    tile.healthEffect = amount;
    tile.armor = armorObject;
    tile.weapon = weaponObject;
    
    return tile;
}

-(LDCharacter *)createCharacter:(int)health damage:(int)damage
{
    LDCharacter *character = [[LDCharacter alloc] init];
    character.health = health;
    character.damage = damage;
    return character;
}

-(LDWeapon *)createWeapon:(NSString *)name damage:(int)damage
{
    LDWeapon *weapon = [[LDWeapon alloc] init];
    weapon.name = name;
    weapon.damage = damage;
    return weapon;
}

-(LDArmor *)createArmor:(NSString *)name health:(int)health
{
    LDArmor *armor = [[LDArmor alloc] init];
    armor.name = name;
    armor.health = health;
    return armor;
}

@end
