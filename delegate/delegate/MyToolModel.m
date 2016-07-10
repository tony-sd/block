//
//  MyToolModel.m
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "MyToolModel.h"



static MyToolModel *tool;

@implementation MyToolModel

+ (instancetype)sharenstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[MyToolModel alloc] init];
    });

    return tool;
}

- (void)MyToolModelPrintFinish:(finishBlock) block
{
    NSLog(@"MyToolModelPrintFinish -- %@",self);

    if (block)
    {
        block(self.name);
    }
}


@end
