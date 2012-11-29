//
//  ViewListingViewController.h
//  UniFied
//
//  Created by Nicholas Hoekstra on 11/28/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewListingViewController : UIViewController {
    IBOutlet UIImageView *imageThumbnail;
    
    IBOutlet UILabel *titleText;
    IBOutlet UILabel *authorText;
    IBOutlet UILabel *isbnText;
    IBOutlet UILabel *editionText;
    IBOutlet UILabel *courseText;
    IBOutlet UILabel *conditionText;
    IBOutlet UITextView *commentText;
}

- (IBAction)editButton;
- (IBAction)doneButton;

@end
