//
//  MasterViewController.m
//  MQSimpleDataSource
//
//  Created by setacinq on 1/19/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MyDataSource.h"

@interface MasterViewController ()

@property (strong, nonatomic) MQSimpleDataSource *dataSource;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.dataSource = [[MyDataSource alloc] initWithItems:nil
                                           cellIdentifier:@"Cell"
                                       cellConfigureBlock:^(UITableViewCell* cell, id item, NSIndexPath *indexPath) {
                                           cell.textLabel.text = [item description];
                                       }];
    self.tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    
    [self.dataSource.items insertObject:[NSDate date] atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.dataSource.items[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
