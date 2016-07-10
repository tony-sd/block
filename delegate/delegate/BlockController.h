//
//  BlockController.h
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^myBlock)(NSString *name);

@interface BlockController : UIViewController

@property (copy , nonatomic) myBlock testBlock;

@property (copy , nonatomic) NSString * name;


@end
