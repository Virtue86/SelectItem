//
//  SelectModel.m
//  SelectRoom
//
//  Created by Virtue on 2018/6/6.
//  Copyright © 2018年 none. All rights reserved.
//

#import "SelectModel.h"

@implementation SelectModel
- (instancetype)initWithNum:(int)num  {
    if (self = [super init]) {
        self.num = num;
        self.isSelect = NO;
    }
    return self;
}
@end
