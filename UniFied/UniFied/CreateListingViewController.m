//
//  CreateListingViewController.m
//  UniFied
//
//  Created by Nicholas Hoekstra on 11/23/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import "CreateListingViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CreateListingViewController ()

@end

@implementation CreateListingViewController

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

    // Loads the keyboard dismissal on tap outside textField
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO]; // Allows other tap gestures to continue functioning while this one is in effect
}

- (void)viewDidUnload
{
    titleText = nil;
    authorText = nil;
    isbnText = nil;
    editionText = nil;
    courseText = nil;
    conditionText = nil;
    commentText = nil;
    imageThumbnail = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backButton {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)dismissKeyboard {
    
}

@end
