//
//  textbookTableViewController.h
//  UniFied
//
//  Created by narbeh shahnazarian on 12-11-27.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "enableDisableData.h"
//This class is for handling the texbook listings section of Unified.  We use a tableView and a search bar to display and search the lisitngs.
@interface textbookTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

//our properties for the tableView and the Searchbar
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

//This is an action method tho handle the scenario of the user pressing the 'back' butoon.
- (IBAction)backButton;

@end
