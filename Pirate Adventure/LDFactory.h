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
#import "LDBoss.h"

@interface LDFactory : NSObject

-(NSArray *)createTileSet;

-(LDCharacter *)createCharacter;
-(LDBoss *)createBoss;

@end
