//
//  TableViewCell.h
//  SelectRoom
//
//  Created by Virtue on 2018/6/6.
//  Copyright © 2018年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewCell;
@protocol TableViewCellDelegate <NSObject>
- (void)didSelectTableCell:(TableViewCell *)cell itemIndex:(NSInteger)index;
@end

@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) id<TableViewCellDelegate>delegate;

@property (nonatomic, strong) NSArray *tempArray;

@end
