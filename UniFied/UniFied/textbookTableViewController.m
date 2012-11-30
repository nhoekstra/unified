//
//  textbookTableViewController.m
//  UniFied
//
//  Created by narbeh shahnazarian on 12-11-27.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import "textbookTableViewController.h"

@interface textbookTableViewController ()
{
    //we initialize our array's to hold our table information.
    NSMutableArray *totalStrings;
    
    //this array is for filtering out the table once the user tries to search via the search bar.
    NSMutableArray *filterStrings;
    
    BOOL isFitered;

}

@end

@implementation textbookTableViewController

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
    
    //initialize delagates and datasource
    self.searchBar.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //manually fill our table
    totalStrings = [[NSMutableArray alloc] initWithObjects:@"Math Calculus", @"Discrete Math", @"History: The Western World", @"Understanding Poetry", @"Algorithm Design", @"Java Walls and Mirrors", nil];
}

//This method is to handle the event where the user is searching in the search bar for a book
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0)
    {
        isFitered = NO;
    }//end if
    else
    {
        isFitered = YES;
        filterStrings = [[NSMutableArray alloc] init];
        
        //parse what the user ahs typed
        for (NSString *str in totalStrings) {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (stringRange.location != NSNotFound)
            {
                [filterStrings addObject:str];
            }
        }
    }
    
    //we reload the table dat in the end to refresh out view
    [self.tableView reloadData];
}

//method to handle the dismissing of the keyboard
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    
}

//method to return the number of rows in our table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (isFitered) {
        return filterStrings.count;
    }
    
    else
    {
        
        return totalStrings.count;
    }
}

//method to handle setting up our table view with our array and the approproate text for each cell.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        //cell.textLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        cell.textLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        //cell.detailTextLabel.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
        //cell.detailTextLabel.textColor =  [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
    }
    
    if(!isFitered)
    {
        cell.textLabel.text = [totalStrings objectAtIndex:indexPath.row];
        
    }//end if
    else
    {
        cell.textLabel.text = [filterStrings objectAtIndex:indexPath.row];
    }
    
    return cell;
    
}

//method to handle the selection of a row in the table and how to transition to the appropriate page.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *curCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *st = curCell.textLabel.text;
    //NSLog(@"this is the cell %@",st);
    
    UINavigationController *myView = [self.storyboard instantiateViewControllerWithIdentifier:st];
    [curCell setSelected:NO animated:YES];
    [self.navigationController pushViewController:myView animated:YES];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
}

- (IBAction)backButton {
    [self dismissModalViewControllerAnimated:YES];
}
@end
