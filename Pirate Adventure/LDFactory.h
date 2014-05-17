//
//  LDFactory.h
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/15/14.
//
//

#import <Foundation/Foundation.h>
#import "LDTile.h"

@interface LDFactory : NSObject

+(NSArray *)createTileSet;
+(LDTile *)createTileWithStory:(NSString *)story backgroundImage:(NSString *)backgroundImageFile;
@end
