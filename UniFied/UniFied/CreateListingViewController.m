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
    
    // Used to edit UITextView's appearance
    textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 220, 200, 100)];
    
    // Change rounded corners
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
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

@end
