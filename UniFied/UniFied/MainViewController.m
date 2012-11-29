//
//  MainViewController.m
//  UniFied
//
//  Created by Nicholas Hoekstra on 11/17/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize logOut;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [logOut setEnabled:NO];
    //self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setLogOut:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
