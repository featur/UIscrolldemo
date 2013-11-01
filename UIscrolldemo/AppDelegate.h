//
//  AppDelegate.h
//  UIscrolldemo
//
//  Created by Add on 13-7-15.
//  Copyright (c) 2013年 shinyv. All rights reserved.
//


NSArray *(^sendValue)();


#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic)NSArray *value;

@end
