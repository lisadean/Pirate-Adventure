//
//  LDFactory.h
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/15/14.
//
//

#import <Foundation/Foundation.h>
#import "LDTile.h"
#import "LDCharacter.h"
#import "LDWeapon.h"
#import "LDArmor.h"

@interface LDFactory : NSObject

+(NSArray *)createTileSet;

+(LDTile *)createTileWithStory:(NSString *)story backgroundImage:(NSString *)backgroundImageFile;
+(LDTile *)createTileWithStory:(NSString *)story backgroundImage:(NSString *)backgroundImageFile specialEffect:(NSString *)effect;

+(LDCharacter *)createCharacter;
+(LDWeapon *)createWeaponWithName:(NSString *)name damage:(int)damage;
+(LDArmor *)createArmorWithName:(NSString *)name health:(int)health;
@end
