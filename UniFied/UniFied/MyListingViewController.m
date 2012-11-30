//
//  MyListingViewController.m
//  UniFied
//
//  Created by Nicholas Hoekstra on 11/30/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import "MyListingViewController.h"

@interface MyListingViewController ()

@end

@implementation MyListingViewController

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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *image = [defaults dataForKey:@"image"];
    imageThumbnail.image = [UIImage imageWithData:image];
    titleText.text = [defaults objectForKey:@"title"];
    authorText.text = [defaults objectForKey:@"author"];
    isbnText.text = [defaults objectForKey:@"isbn"];
    editionText.text = [defaults objectForKey:@"edition"];
    courseText.text = [defaults objectForKey:@"course"];
    conditionText.text = [defaults objectForKey:@"condition"];
    commentText.text = [defaults objectForKey:@"comment"];
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
