//
//  MyToolModel.h
//  delegate
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^finishBlock)(NSString *name);

#define kMyToolModel [MyToolModel sharenstance]

@interface MyToolModel : NSObject

+ (instancetype)sharenstance;

- (void)MyToolModelPrintFinish:(finishBlock) block;

@property (copy , nonatomic) NSString * name;


@end
