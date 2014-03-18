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
@property (strong, nonatomic) IBOutlet UIButton *myAddButton;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation FLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    items = [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three",nil];
    self.myTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.myTableView.bounds.size.width, 0.01f)];

    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.myTableView addGestureRecognizer:tapGestureRecognizer];
    
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

- (IBAction)onAddButtonPressed:(id)sender {

    NSString *myText = self.myTextField.text;
    myText = [myText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (![myText isEqualToString:@""]) {
        [items addObject:[NSString stringWithString:myText]];
        self.myTextField.text=@"";
        [self.myTableView reloadData];
        [self.myTextField resignFirstResponder];
    }
}

- (void)dismissKeyboard {
    
    NSLog(@"dismissKeyboard");
    
    [self.myTextField resignFirstResponder];
    
}

@end
