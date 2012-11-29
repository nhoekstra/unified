//
//  CreateListingViewController.h
//  UniFied
//
//  Created by Nicholas Hoekstra on 11/23/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateListingViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UITapGestureRecognizer *tap;
    IBOutlet UIImageView *imageThumbnail;

    IBOutlet UITextField *titleText;
    IBOutlet UITextField *authorText;
    IBOutlet UITextField *isbnText;
    IBOutlet UITextField *editionText;
    IBOutlet UITextField *courseText;
    IBOutlet UITextField *conditionText;
    IBOutlet UITextView *commentText;
    
    UIImagePickerController *picker1;
    IBOutlet UIScrollView *scroller;
}
- (IBAction)photoPicker;
- (IBAction)backButton;
- (void)dismissKeyboard;
- (IBAction)createListing;
- (IBAction)textFieldFinished:(id)sender;

@end
