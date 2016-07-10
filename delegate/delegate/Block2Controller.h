//
//  Block2Controller.h
//  delegate
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myBlock)(NSString *name);

@interface Block2Controller : UIViewController


@property (copy , nonatomic) myBlock b1;


- (void)sendValue:(myBlock)value;


@end
