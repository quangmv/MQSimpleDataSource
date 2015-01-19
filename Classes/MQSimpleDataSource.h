//
//  MQUITableViewDataSource.h
//  MQUITableViewDataSource
//
//  Created by quang.app@gmail.com on 1/19/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MQCellConfigureBlock)(id cell, id item, NSIndexPath* indexPath);

@interface MQSimpleDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *items;

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 cellConfigureBlock:(MQCellConfigureBlock) configureBlock;

- (void)setXibFileName:(NSString *)xibFileName;

- (void)setCellClassName:(NSString *)cellClassName;

@end
