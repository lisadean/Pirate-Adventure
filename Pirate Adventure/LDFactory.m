//
//  LDFactory.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/15/14.
//
//

#import "LDFactory.h"

@implementation LDFactory

+(NSArray *)createTileSet
{
    LDTile *tile1 = [self createTileWithStory:@"You have arrived at the start of your adventure. Which direction will you go?" backgroundImage:@"PirateStart.jpg"];
    LDTile *tile2 = [self createTileWithStory:@"Blacksmith" backgroundImage:@"PirateBlacksmith.jpeg"];
    LDTile *tile3 = [self createTileWithStory:@"Weapons" backgroundImage:@"PirateWeapons.jpeg"];
    
    LDTile *tile4 = [self createTileWithStory:@"Dock" backgroundImage:@"PirateFriendlyDock.jpg"];
    LDTile *tile5 = [self createTileWithStory:@"Attack" backgroundImage:@"PirateAttack.jpg"];
    LDTile *tile6 = [self createTileWithStory:@"Ship Battle" backgroundImage:@"PirateShipBattle.jpeg"];
    
    LDTile *tile7 = [self createTileWithStory:@"Octopus" backgroundImage:@"PirateOctopusAttack.jpg"];
    LDTile *tile8 = [self createTileWithStory:@"Boss" backgroundImage:@"PirateBoss.jpeg"];
    LDTile *tile9 = [self createTileWithStory:@"Plank" backgroundImage:@"PiratePlank.jpg"];
    
    LDTile *tile10 = [self createTileWithStory:@"Treasure!" backgroundImage:@"PirateTreasure.jpeg"];
    LDTile *tile11 = [self createTileWithStory:@"Parrot" backgroundImage:@"PirateParrot.jpg"];
    LDTile *tile12 = [self createTileWithStory:@"Treasure" backgroundImage:@"PirateTreasure2.jpeg"];
    
    NSArray *columnArray1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    NSArray *columnArray2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    NSArray *columnArray3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    NSArray *columnArray4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];

    
    NSArray *tileArray = [[NSArray alloc] initWithObjects:columnArray1, columnArray2, columnArray3, columnArray4, nil];

    return tileArray;
}

+(LDTile *)createTileWithStory:(NSString *)story backgroundImage:(NSString *)backgroundImageFile
{
    LDTile *tile = [[LDTile alloc] init];
    tile.story = story;
    tile.backgroundImage = [UIImage imageNamed:backgroundImageFile];
    return tile;
}


@end
