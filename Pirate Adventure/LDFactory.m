//
//  LDFactory.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/15/14.
//
//

#import "LDFactory.h"
#import "LDTile.h"

@implementation LDFactory

-(NSArray *)createTile
{
    LDTile *tile1 = [[LDTile alloc] init];
    tile1.story = @"Start";
    tile1.tileLocation = CGPointMake(0, 0);
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpeg"];
    
    NSArray *tileArray = [[NSArray alloc] initWithObjects:tile1, nil];
    return tileArray;
}


@end
