//
//  SelectModel.h
//  SelectRoom
//
//  Created by Virtue on 2018/6/6.
//  Copyright © 2018年 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectModel : NSObject
@property (nonatomic) int num;
@property (nonatomic) BOOL isSelect;

- (instancetype)initWithNum:(int)num;
@end
