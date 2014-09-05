//
//  LDViewController.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/14/14.
//
//

#import "LDViewController.h"

@interface LDViewController ()

@end

@implementation LDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Create tileset and character
    LDFactory *factory = [[LDFactory alloc] init];
    self.tileSet = [factory createTileSet];
    self.character = [factory createCharacter:100 damage:10];
    
    // Set button colors
    //self.northButton.backgroundColor = [UIColor blackColor];
    //self.eastButton.backgroundColor = [UIColor blackColor];
    //self.southButton.backgroundColor = [UIColor blackColor];
    //self.westButton.backgroundColor = [UIColor blackColor];
    
    // Set current point and load tile
    self.currentPoint = CGPointMake(0, 0);
    [self loadNewTile:self.currentPoint];
    
    // Load character info
    self.healthLabel.text = [NSString stringWithFormat:@"%i",self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    if (self.character.weapon)
    {
        self.weaponLabel.text = self.character.weapon.name;
    }
    else
    {
        self.weaponLabel.text = @"None";
    }
    if (self.character.armor)
    {
        self.armorLabel.text = self.character.armor.name;
    }
    else
    {
        self.armorLabel.text = @"None";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadNewTile:(CGPoint)tilePoint
{
    self.currentPoint = tilePoint;
    self.currentTile = [[self.tileSet objectAtIndex:tilePoint.x] objectAtIndex:tilePoint.y];
    
    self.backgroundImage.image = self.currentTile.backgroundImage;
    self.storyLabel.text = self.currentTile.story;
    if (self.currentTile.actionButtonTitle) {
        [self.actionButton setTitle:self.currentTile.actionButtonTitle forState:UIControlStateNormal];
    }
    else
    {
        [self.actionButton setTitle:@"No action" forState:UIControlStateNormal];
    }
    
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

- (IBAction)northButtonPressed:(UIButton *)sender
{
    NSLog(@"north pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x, (self.currentPoint.y + 1));
    if ([self tileValid:newPoint])
    {
        [self loadNewTile:newPoint];
    }
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    NSLog(@"east pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    if ([self tileValid:newPoint])
    {
        [self loadNewTile:newPoint];
    }

}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    NSLog(@"south pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    if ([self tileValid:newPoint])
    {
        [self loadNewTile:newPoint];
    }
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    NSLog(@"west pressed");
    CGPoint newPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    if ([self tileValid:newPoint])
    {
        [self loadNewTile:newPoint];
    }
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
}

@end
