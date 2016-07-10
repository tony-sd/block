//
//  DelegateController.m
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "DelegateController.h"

@interface DelegateController ()

@end

@implementation DelegateController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.name = @"i am delegateController";

    [self addObserver:self forKeyPath:@"kvoValue" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];


}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context
{
    NSLog(@"keypath --- %@",keyPath);
    NSLog(@"object --- %@",object);
}




- (IBAction)btnClick:(UIButton *)sender
{
    NSLog(@"点我反向传值 --- delegate -- value = %@",self.name);

    if ([self.delegate respondsToSelector:@selector(DelegateControllerSendValue:)])
    {
        [self.delegate DelegateControllerSendValue:self.name];
    }

}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"kvoValue"];
    NSLog(@"shifang -- %@",self);
}



- (IBAction)kvoListenTo:(id)sender
{

    NSLog(@"KVO --- ");

    self.kvoValue = @"1234567890...";
    
}



@end
