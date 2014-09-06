//
//  LDViewController.h
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/14/14.
//
//

#import <UIKit/UIKit.h>
#import "LDFactory.h"
#import "LDCharacter.h"

@interface LDViewController : UIViewController

#pragma mark - IBActions
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)actionButtonPressed:(UIButton *)sender;

#pragma mark - IBOutlets

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

#pragma mark - iVars
@property (strong, nonatomic) NSArray *tileSet;
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) LDCharacter *character;
@property (strong, nonatomic) LDBoss *boss;

@end
