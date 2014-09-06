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
             [self createTile:@"You have arrived at the start of your adventure. Do you accept the challenge?" backgroundImage:@"PirateStart.jpg" actionButtonTitle:@"Accept the challenge" healthEffect:10 armor:nil weapon:nil],
         
             [self createTile:@"You visit the local blacksmith. There is iron armor here." backgroundImage:@"PirateBlacksmith.jpeg" actionButtonTitle:@"Pick up iron armor" healthEffect:0 armor:[self createArmor:@"Iron armor" health:30] weapon:nil],
         
             [self createTile:@"You happen upon a weapons hold. There is a blunt sword here." backgroundImage:@"PirateWeapons.jpeg" actionButtonTitle:@"Pick up sword" healthEffect:0 armor:nil weapon:[self createWeapon:@"Blunt sword" damage:40]],
         
             nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTile:@"You walk up to the dock and see sailors busy working. They look friendly. Ask for directions?" backgroundImage:@"PirateFriendlyDock.jpg" actionButtonTitle:@"Ask for directions" healthEffect:12 armor:nil weapon:nil],
         
            [self createTile:@"A group of pirates attempts to board your ship." backgroundImage:@"PirateAttack.jpg" actionButtonTitle:@"Fight back against pirates" healthEffect:-15 armor:nil weapon:nil],
         
            [self createTile:@"You have sighted a pirate battle off the coast.  Should we intervene?" backgroundImage:@"PirateShipBattle.jpeg" actionButtonTitle:@"Fire ze missiles!" healthEffect:8 armor:nil weapon:nil],
         
            nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTile:@"The legend of the deep.  The mighty kraken appears" backgroundImage:@"PirateOctopusAttack.jpg" actionButtonTitle:@"Abandon ship" healthEffect:-46 armor:nil weapon:nil],
         
            [self createTile:@"Your final faceoff with the fearsome pirate boss!" backgroundImage:@"PirateBoss.jpeg" actionButtonTitle:@"Fight!" healthEffect:-15 armor:nil weapon:nil],
         
            [self createTile:@"You have been captured by pirates and are ordered to walk the plank" backgroundImage:@"PiratePlank.jpg" actionButtonTitle:@"Show no fear" healthEffect:-22 armor:nil weapon:nil],
         
            nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTile:@"You have stumbled upon a hidden cave of pirate treasurer" backgroundImage:@"PirateTreasure.jpeg" actionButtonTitle:@"Take the treasure" healthEffect:20 armor:nil weapon:nil],
         
            [self createTile:@"You find a parrot. You've heard that parrots bring good luck" backgroundImage:@"PirateParrot.jpg" actionButtonTitle:@"Give Polly a cracker" healthEffect:0 armor:[self createArmor:@"Lucky Parrot" health:50] weapon:nil],
         
            [self createTile:@"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?" backgroundImage:@"PirateTreasurer2.jpeg" actionButtonTitle:@"Swim deeper" healthEffect:-7 armor:nil weapon:nil],
         
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

-(LDCharacter *)createCharacter
{
    LDCharacter *character = [[LDCharacter alloc] init];
    character.health = 100;
    character.damage = 10;
    character.weapon = [self createWeapon:@"Fists" damage:10];
    character.armor = [self createArmor:@"Tunic" health:10];
    character.health += character.armor.health;
    character.damage += character.weapon.damage;
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

-(LDBoss *)createBoss
{
    LDBoss *boss = [[LDBoss alloc] init];
    boss.health = 100;
    boss.damage = 20;
    return boss;
}

@end
