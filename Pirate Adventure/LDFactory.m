//
//  LDFactory.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/15/14.
//
//

#import "LDFactory.h"
#import "LDArmor.h"
#import "LDWeapon.h"

@implementation LDFactory

+(NSArray *)createTileSet
{
    
    return [[NSArray alloc] initWithObjects:
            
        [[NSArray alloc] initWithObjects:
             [self createTileWithStory:@"You have arrived at the start of your adventure. Which direction will you go?" backgroundImage:@"PirateStart.jpg"],
             [self createTileWithStory:@"Blacksmith" backgroundImage:@"PirateBlacksmith.jpeg" specialEffect:@"Chest Plate"],
             [self createTileWithStory:@"Weapons" backgroundImage:@"PirateWeapons.jpeg" specialEffect:@"Sword"],
             nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTileWithStory:@"Dock" backgroundImage:@"PirateFriendlyDock.jpg"],
            [self createTileWithStory:@"Attack" backgroundImage:@"PirateAttack.jpg"],
            [self createTileWithStory:@"Ship Battle" backgroundImage:@"PirateShipBattle.jpeg"],
            nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTileWithStory:@"Octopus" backgroundImage:@"PirateOctopusAttack.jpg"],
            [self createTileWithStory:@"Boss" backgroundImage:@"PirateBoss.jpeg"],
            [self createTileWithStory:@"Plank" backgroundImage:@"PiratePlank.jpg"],
            nil],
            
        [[NSArray alloc] initWithObjects:
            [self createTileWithStory:@"Treasure!" backgroundImage:@"PirateTreasure.jpeg"],
            [self createTileWithStory:@"Parrot" backgroundImage:@"PirateParrot.jpg"],
            [self createTileWithStory:@"Treasure" backgroundImage:@"PirateTreasurer2.jpeg"],
            nil],
            
        nil];

}

+(LDTile *)createTileWithStory:(NSString *)story backgroundImage:(NSString *)backgroundImageFile specialEffect:(NSString *)effect
{
    LDTile *tile = [self createTileWithStory:story backgroundImage:backgroundImageFile];
    NSArray *options = @[@"Sword", @"Chest Plate", @"damage", @"health"];
    int option = [options indexOfObject:effect];
    switch (option) {
        case 0:
            //sword
            tile.weapon = [self createWeaponWithName:[options objectAtIndex:option] damage:40];
            tile.actionButtonTitle = @"Pick up weapon";
            break;
        case 1:
            //chestplate
            tile.armor = [self createArmorWithName:[options objectAtIndex:option] health:30];
            tile.actionButtonTitle = @"Pick up armor";
            break;
        case 2:
            //damage
            break;
        case 3:
            //health
            break;
        default:
            break;
    }
    return tile;
}


+(LDTile *)createTileWithStory:(NSString *)story backgroundImage:(NSString *)backgroundImageFile
{
    LDTile *tile = [[LDTile alloc] init];
    tile.story = story;
    tile.backgroundImage = [UIImage imageNamed:backgroundImageFile];
    return tile;
}

+(LDCharacter *)createCharacter
{
    LDCharacter *character = [[LDCharacter alloc] init];
    character.health = 100;
    character.damage = 10;
    return character;
}

+(LDWeapon *)createWeaponWithName:(NSString *)name damage:(int)damage
{
    LDWeapon *weapon = [[LDWeapon alloc] init];
    weapon.name = name;
    weapon.damage = damage;
    return weapon;
}

+(LDArmor *)createArmorWithName:(NSString *)name health:(int)health
{
    LDArmor *armor = [[LDArmor alloc] init];
    armor.name = name;
    armor.health = health;
    return armor;
}

@end
