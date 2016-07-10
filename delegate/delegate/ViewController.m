//
//  ViewController.m
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"
#include "DelegateController.h"
#include "BlockController.h"
#include "MyToolModel.h"
#include "Block2Controller.h"



@interface ViewController ()<DelegateControllerDelegate>

@property (nonatomic , strong)DelegateController *delegateVc;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


   // <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
       // <#statements#>
   // };

    //block简单定义及其使用
    int (^myBlock)(NSString *str , NSDictionary *dict) = ^int(NSString *str , NSDictionary *dict)
    {

        NSLog(@"str --- %@",str);

        [dict enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

            NSLog(@"key -- %@",key);
            NSLog(@"obj -- %@",obj);

        }];

        return (int)(str.length + dict.fileSize);
    };


    NSDictionary *dict = @{@"name":@"张三",@"value":@"this value is 8"};

    NSString *str = @"12345.....";

    NSLog(@"block --- %d",myBlock(str,dict));


    MyToolModel *mode = kMyToolModel;
    mode.name = @"张三。。。";

    [kMyToolModel MyToolModelPrintFinish:^(NSString *name) {

        NSLog(@"block --- 回调 。。。。 %@",name);

    }];



    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendNotifyCation:) name:@"sendNotify" object:nil];



}

//通知
- (void)sendNotifyCation:(NSNotification *)notify
{
    NSLog(@"接收到的通知 --- %@",notify.object);
}


- (IBAction)btnClick:(UIButton *)sender
{
//    NSLog(@"block 正向传值 。。。 %@",sender);

    Block2Controller *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Block2VC"];

    //第三种方式
    [vc sendValue:^(NSString *name) {

        NSLog(@"name sendValue--- %@",name);

    }];


// 第二种方式 通过设置set方法返回
//    [vc setB1:^(NSString *str)
//     {
//
//         NSLog(@"sr --- %@",str);
//
//     }];

    //1、通过属性的方式获取控制器二block中的值

//    vc.b1 = ^(NSString *str)
//    {
//
//        NSLog(@"str --- %@",str);
//    };


    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender
{


    if ([segue.identifier isEqualToString:@"blockSendValue"]) //block传值
    {
        NSLog(@"block 传值 --- %@",segue.identifier);

        BlockController *blockVC = (BlockController *)segue.destinationViewController;

        blockVC.testBlock = ^(NSString *name)
        {

            NSLog(@"block 传过来的值是- --- %@",name);

        };


    }
    else
    {

        NSLog(@"delegate 传值 --- %@",segue.identifier);

        DelegateController *delegateVC = (DelegateController *)segue.destinationViewController;
        delegateVC.delegate = self;



    }

    NSLog(@"prepareForSegue --- %@ ----- sender --- %@",segue,sender);


}


- (void)DelegateControllerSendValue:(NSString *)name
{
    NSLog(@"DelegateControllerSendValue -- %@",name);
}




- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"value"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
