//
//  LDTile.h
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/14/14.
//
//

#import <Foundation/Foundation.h>
#import "LDWeapon.h"
#import "LDArmor.h"

@interface LDTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonTitle;
@property (strong, nonatomic) LDWeapon *weapon;
@property (strong, nonatomic) LDArmor *armor;
@property (nonatomic) int healthEffect;

@end
