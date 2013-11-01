//
//  RootViewController.h
//  UIscrolldemo
//
//  Created by Add on 13-7-15.
//  Copyright (c) 2013年 shinyv. All rights reserved.
//


//void (^sendValue)(NSArray *value);
#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    UIScrollView *mScrollerView;
    UIPageControl*mPageControl;
}
//@property(nonatomic,copy)void (^sendValue)(NSArray *value);
@end
