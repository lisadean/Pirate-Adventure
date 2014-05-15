//
//  LDViewController.m
//  Pirate Adventure
//
//  Created by Lisa Dean on 5/14/14.
//
//

#import "LDViewController.h"
#import "LDFactory.h"

@interface LDViewController ()

@end

@implementation LDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    LDFactory *tileArray = [[LDFactory alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
