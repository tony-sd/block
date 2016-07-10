//
//  DelegateController.h
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DelegateController;
@protocol DelegateControllerDelegate <NSObject>

@optional

- (void)DelegateControllerSendValue:(NSString *)name;

@end

@interface DelegateController : UIViewController


@property (copy , nonatomic) NSString * name;


@property (weak , nonatomic) id<DelegateControllerDelegate> delegate;


@property (copy , nonatomic) NSString * kvoValue;



@end
