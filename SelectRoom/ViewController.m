//
//  ViewController.m
//  SelectRoom
//
//  Created by Virtue on 2018/6/6.
//  Copyright © 2018年 none. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "SelectModel.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,TableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

static NSString *cellIdentifier = @"RoomCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self createData];
}

#pragma mark data
- (void)createData {
    for (int i = 0; i < 9; i++) {
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int j = 0; j < 5; j++) {
            
            SelectModel *model = [[SelectModel alloc] initWithNum:i + 1];
            [tempArray addObject:model];
        }
        
        [self.dataArray addObject:tempArray];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 76;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.tempArray = _dataArray[indexPath.row];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark TableViewCellDelegate
- (void)didSelectTableCell:(TableViewCell *)cell itemIndex:(NSInteger)index {
    NSIndexPath *indexPatch = [self.tableView indexPathForCell:cell];
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:_dataArray[indexPatch.row]];
    
    //还原本列的数据，一列只能选中一个
    [_dataArray enumerateObjectsUsingBlock:^(NSArray * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SelectModel *model = obj[index];
        model.isSelect = NO;
    }];
    // 选中本列此格
    [tempArray enumerateObjectsUsingBlock:^(SelectModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        if (index == idx) {
            model.isSelect = !model.isSelect;
            //去看log
            [self setLogWithModel:model index:index];
            
            *stop = YES;
        }
    }];
    
    [_dataArray replaceObjectAtIndex:indexPatch.row withObject:tempArray];
    [self.tableView reloadData];
}

- (void)setLogWithModel:(SelectModel *)model index:(NSInteger)index{
    // index 代表样式 0 室 1 厅 2 厨 3卫 4 阳台

    switch (index) {
        case 0:
            NSLog(@"已经选择了 %d 室", model.num);
            break;
        case 1:
            NSLog(@"已经选择了 %d 厅", model.num);
            break;
        case 2:
            NSLog(@"已经选择了 %d 厨", model.num);
            break;
        case 3:
            NSLog(@"已经选择了 %d 卫", model.num);
            break;
        case 4:
            NSLog(@"已经选择了 %d 阳台", model.num);
            break;
        default:
            break;
    }
}

#pragma mark 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 80)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
