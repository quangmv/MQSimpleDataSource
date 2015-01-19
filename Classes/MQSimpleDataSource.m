//
//  MQUITableViewDataSource.m
//  MQUITableViewDataSource
//
//  Created by quang.app@gmail.com on 1/19/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "MQSimpleDataSource.h"
#import <objc/message.h>

@interface MQSimpleDataSource ()


@property (strong, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) NSString *cellName;

@property (assign, nonatomic) BOOL isCellFromXib;

@property (copy, nonatomic) MQCellConfigureBlock configureBlock;

@end

@implementation MQSimpleDataSource

- (id)initWithItems:(id) items
     cellIdentifier:(NSString *)cellIdentifier
 cellConfigureBlock:(MQCellConfigureBlock)configureBlock
{
    self = [super init];
    if(self) {
        if ([items isKindOfClass:[NSArray class]]) {
            self.items = (NSMutableArray*)[items mutableCopy];
        } else if ([items isKindOfClass:[NSMutableArray class]]) {
            self.items = [items mutableCopy];
        } else {
            self.items = [NSMutableArray array];
        }
        
        self.cellIdentifier = cellIdentifier;
        self.configureBlock = configureBlock;
        self.cellName = @"UITableViewCell";
        self.isCellFromXib = NO;
    }
    return self;
}

- (void)setXibFileName:(NSString *)xibFileName
{
    self.cellName = xibFileName;
    self.isCellFromXib = YES;
}

- (void)setCellClassName:(NSString *)cellClassName
{
    self.cellName = cellClassName;
    self.isCellFromXib = NO;
}

#pragma mark - UITableViewDataSource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        if (self.isCellFromXib) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:self.cellName
                                                         owner:self
                                                       options:nil];
            cell = [nib objectAtIndex:0];
        } else {
            cell = [[NSClassFromString(self.cellName) alloc] initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:self.cellIdentifier];
        }
    }
    
    // get item
    id item = [self.items objectAtIndex:indexPath.row];
    
    // configure cell
    if (self.configureBlock) {
        self.configureBlock(cell, item, indexPath);
    }
    return cell;
}

@end
