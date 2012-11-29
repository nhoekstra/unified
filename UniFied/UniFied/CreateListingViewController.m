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
    
    [scroller setContentSize:CGSizeMake(320, 585)];
    
    // Loads the keyboard dismissal on tap outside textField
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO]; // Allows other tap gestures to continue functioning while this one is in effect
    
    
    
    
    //[titleText setDelegate:self];
    [titleText setReturnKeyType:UIReturnKeyDone];
    [titleText addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //[authorText setDelegate:self];
    [authorText setReturnKeyType:UIReturnKeyDone];
    [authorText addTarget:self
                  action:@selector(textFieldFinished:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //[isbnText setDelegate:self];
    [isbnText setReturnKeyType:UIReturnKeyDone];
    [isbnText addTarget:self
                  action:@selector(textFieldFinished:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //[editionText setDelegate:self];
    [editionText setReturnKeyType:UIReturnKeyDone];
    [editionText addTarget:self
                  action:@selector(textFieldFinished:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //[courseText setDelegate:self];
    [courseText setReturnKeyType:UIReturnKeyDone];
    [courseText addTarget:self
                  action:@selector(textFieldFinished:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //[conditionText setDelegate:self];
    [conditionText setReturnKeyType:UIReturnKeyDone];
    [conditionText addTarget:self
                  action:@selector(textFieldFinished:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (IBAction)textFieldFinished:(id)sender {
    // [sender resignFirstResponder];
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
    //imageView = nil;
    //imageThumbnail = nil;
    scroller = nil;
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
    [titleText resignFirstResponder];
    [authorText resignFirstResponder];
    [isbnText resignFirstResponder];
    [editionText resignFirstResponder];
    [courseText resignFirstResponder];
    [conditionText resignFirstResponder];
    [commentText resignFirstResponder];
}

- (IBAction)createListing{
    [self dismissKeyboard];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *title = [titleText text];
    NSString *author =[authorText text];
    NSString *isbn = [isbnText text];
    NSString *edition = [editionText text];
    NSString *course = [courseText text];
    NSString *condition = [conditionText  text];
    NSString *comment = [commentText  text];
    UIImage *storeImage = imageThumbnail.image;
    NSData *image = UIImageJPEGRepresentation(storeImage, 100);
    
    if ([comment isEqualToString:@"Add any comments here."]) {
        comment = nil;
    }
    
    [defaults setObject:title forKey:@"title"];
    [defaults setObject:author forKey:@"author"];
    [defaults setObject:isbn forKey:@"isbn"];
    [defaults setObject:edition forKey:@"edition"];
    [defaults setObject:course forKey:@"course"];
    [defaults setObject:condition forKey:@"condition"];
    [defaults setObject:comment forKey:@"comment"];
    [defaults setObject:image forKey:@"image"];
    
    [defaults synchronize];
}

-(IBAction)photoPicker
{
    //initialization of the picker
    picker1 = [[UIImagePickerController alloc] init];
    picker1.delegate = self;
    
    //we set the picker to reference the photolibrary
    [picker1 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    //we present an animated transtion to the selceted modal view: photo library or camera.
    [self presentViewController:picker1 animated:YES completion:Nil];
    
    
}

//here we allow the user to pick a photo from their photolibrary to display in their posting
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:Nil];
    [picker dismissModalViewControllerAnimated:YES];
	imageThumbnail.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

//method to dismis the photo library after the photo has been chosen.
-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
