//
//  ViewListingViewController.m
//  UniFied
//
//  Created by Nicholas Hoekstra on 11/28/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import "ViewListingViewController.h"

@interface ViewListingViewController ()

@end

@implementation ViewListingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doneButton {
    [[[self parentViewController] parentViewController] dismissModalViewControllerAnimated:YES];
}

- (IBAction)editButton {
    [self dismissModalViewControllerAnimated:YES];
}

@end
