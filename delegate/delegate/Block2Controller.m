//
//  Block2Controller.m
//  delegate
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "Block2Controller.h"

@interface Block2Controller ()

@end

@implementation Block2Controller

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.b1 = ^(NSString *str)
//    {
//
//        NSLog(@"b1 -- %@",str);
//
//    };
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    if(self.b1 != nil)
    {
        self.b1(@"张三--- ");
    }
}


- (void)sendValue:(myBlock)value
{
    self.b1 = value;

    

}

@end
