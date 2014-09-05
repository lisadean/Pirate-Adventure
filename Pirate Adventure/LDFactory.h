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

@interface LDFactory : NSObject

-(NSArray *)createTileSet;

-(LDCharacter *)createCharacter:(int)health damage:(int)damage;

@end
