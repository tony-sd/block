//
//  BlockController.m
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "BlockController.h"

@interface BlockController ()

@end

@implementation BlockController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.name = @"i am is BlockController";

}


- (IBAction)btnClick:(UIButton *)sender
{

    NSLog(@"点我传值 --- %@",self.name);

    if(self.testBlock)
    {
        self.testBlock(self.name);
    }

}



- (IBAction)sendNotify:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendNotify" object:@"发送通知，携带数据123"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
