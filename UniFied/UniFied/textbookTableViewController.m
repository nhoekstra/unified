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
    NSMutableArray *totalStrings;
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
    self.searchBar.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    totalStrings = [[NSMutableArray alloc] initWithObjects:@"Math Calculus", @"Discrete Math", @"History: The Western World", @"Poetry in Motion", @"Algorithm Design", nil];
}


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
        
        for (NSString *str in totalStrings) {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (stringRange.location != NSNotFound)
            {
                [filterStrings addObject:str];
            }
        }
    }
    [self.tableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    
}


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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
