//
//  FLXViewController.m
//  DoIt
//
//  Created by Wes Benwick on 3/18/14.
//  Copyright (c) 2014 FileLogix. All rights reserved.
//

#import "FLXViewController.h"

@interface FLXViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *items;
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation FLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    items = [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three",nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSLog(@"row = %i", indexPath.row);
    cell = [tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", items[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}



@end
