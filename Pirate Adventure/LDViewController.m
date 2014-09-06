//
//  LDViewController.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/14/14.
//
//

#import "LDViewController.h"
#import "LDTile.h"

@interface LDViewController ()

@end

@implementation LDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create tileset and character
    LDFactory *factory = [[LDFactory alloc] init];
    self.tileSet = [factory createTileSet];
    self.character = [factory createCharacter];
    self.boss = [factory createBoss];
    
    // Set current point and load tile
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile:self.currentPoint];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    LDTile *currentTile = [[LDTile alloc] init];
    currentTile = [[self.tileSet objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (currentTile.weapon != nil)
    {
        self.character.damage = self.character.damage - self.character.weapon.damage + currentTile.weapon.damage;
        self.character.weapon = currentTile.weapon;
    }
    if (currentTile.armor != nil)
    {
        self.character.health = self.character.health - self.character.armor.health + currentTile.armor.health;
        self.character.armor = currentTile.armor;
    }
    if (currentTile.healthEffect != 0)
    {
        self.character.health = self.character.health + currentTile.healthEffect;
    }
    if ([currentTile.backgroundImage isEqual:[UIImage imageNamed:@"PirateBoss.jpeg"]])
    {
        self.boss.health -= self.character.weapon.damage;
    }
    
    if (self.character.health <= 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"DEATH!" message:@"You have been slain. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [self resetGame];
    }
    else if (self.boss.health <= 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"VICTORY" message:@"You were victorious over the pirate boss!" delegate:nil cancelButtonTitle:@"Restart" otherButtonTitles:nil];
        [alertView show];
        [self resetGame];
    }
    else
    {
        [self updateTile:self.currentPoint];
        
        if (![currentTile.backgroundImage isEqual:[UIImage imageNamed:@"PirateBoss.jpeg"]])
        {
            self.actionButton.hidden = YES;
        }
    }
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    NSLog(@"north pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x, (self.currentPoint.y + 1));
    if ([self tileValid:newPoint])
    {
        [self updateTile:newPoint];
    }
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    NSLog(@"east pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    if ([self tileValid:newPoint])
    {
        [self updateTile:newPoint];
    }

}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    NSLog(@"south pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    if ([self tileValid:newPoint])
    {
        [self updateTile:newPoint];
    }
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    NSLog(@"west pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    if ([self tileValid:newPoint])
    {
        [self updateTile:newPoint];
    }
}

#pragma mark - Helper methods

-(void)updateTile:(CGPoint)tilePoint
{
    self.currentPoint = tilePoint;
    
    LDTile *currentTile = [[LDTile alloc] init];
    currentTile = [[self.tileSet objectAtIndex:tilePoint.x] objectAtIndex:tilePoint.y];
    
    self.backgroundImage.image = currentTile.backgroundImage;
    self.storyLabel.text = currentTile.story;
    
    [self.actionButton setTitle:currentTile.actionButtonTitle forState:UIControlStateNormal];
    self.actionButton.hidden = NO;
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i",self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.weaponLabel.text = self.character.weapon.name;
    self.armorLabel.text = self.character.armor.name;
    
    self.northButton.hidden = tilePoint.y >= [[self.tileSet objectAtIndex:tilePoint.x] count] - 1;
    self.eastButton.hidden = tilePoint.x >= [self.tileSet count] - 1;
    self.southButton.hidden = tilePoint.y <= 0;
    self.westButton.hidden = tilePoint.x <= 0;
}

-(BOOL)tileValid:(CGPoint)tilePoint
{
    NSLog(@"tilePoint %f,%f", tilePoint.x, tilePoint.y);
    if ((tilePoint.x >= 0) && (tilePoint.x < [self.tileSet count]) && (tilePoint.y >= 0) && (tilePoint.y < [[self.tileSet objectAtIndex:tilePoint.x] count]))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)resetGame
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

@end
