//
//  TableViewCell.m
//  SelectRoom
//
//  Created by Virtue on 2018/6/6.
//  Copyright © 2018年 none. All rights reserved.
//

#import "TableViewCell.h"
#import "SelectModel.h"
#define FORMAT(f, ...)      [NSString stringWithFormat:f, ## __VA_ARGS__]

@interface TableViewCell() {
    NSArray *_btnArray;
}
@property (weak, nonatomic) IBOutlet UIButton *roomBtn;
@property (weak, nonatomic) IBOutlet UIButton *parlourBtn;
@property (weak, nonatomic) IBOutlet UIButton *kitchenBtn;
@property (weak, nonatomic) IBOutlet UIButton *toiletBtn;
@property (weak, nonatomic) IBOutlet UIButton *balconyBtn;

@end


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _btnArray = @[_roomBtn,_parlourBtn,_kitchenBtn,_toiletBtn,_balconyBtn];
    
    for (UIButton *btn in _btnArray) {
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor redColor].CGColor;
        
    }
}

- (IBAction)touchBtnCellAction:(UIButton *)sender {
    sender.selected = !sender.selected;

    [_btnArray enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == sender) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectTableCell:itemIndex:)]) {
                [self.delegate didSelectTableCell:self itemIndex:idx];
            }
            *stop = YES;
        }
    }];
    
}

- (void)setTempArray:(NSArray *)tempArray {
    _tempArray = tempArray;

    for (int i = 0; i < _btnArray.count; i++) {
        UIButton *btn = _btnArray[i];
        SelectModel *model = _tempArray[i];
        [btn setTitle:FORMAT(@"%d", model.num) forState:0];
        btn.selected = model.isSelect;
        if (btn.selected) {
            [btn setBackgroundColor:[UIColor redColor]];
        }
        else {
            [btn setBackgroundColor:[UIColor whiteColor]];
        }
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
