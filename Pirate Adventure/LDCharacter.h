//
//  LDCharacter.h
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/14/14.
//
//

#import <Foundation/Foundation.h>
#import "LDWeapon.h"
#import "LDArmor.h"

@interface LDCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) LDWeapon *weapon;
@property (strong, nonatomic) LDArmor *armor;

@end
