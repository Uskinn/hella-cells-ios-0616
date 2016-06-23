//
//  FISHellaMasterTableViewController.m
//  HellaCells
//
//  Created by Sergey Nevzorov on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISHellaMasterTableViewController.h"
#import "FISHellaDetailViewController.h"


@interface FISHellaMasterTableViewController ()



@end

@implementation FISHellaMasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.accessibilityIdentifier = @"Table";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    FISHellaDetailViewController *trancferVC = (FISHellaDetailViewController *)segue.destinationViewController;
    
    NSIndexPath *selectIndexPath = [self.tableView indexPathForSelectedRow];
    
    trancferVC.number = selectIndexPath.row+1;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row + 1];
    
    NSLog(@"cellForRowAtIndexPath is being called");
    
    return cell;
}


@end
