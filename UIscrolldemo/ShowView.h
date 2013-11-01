//
//  ShowView.h
//  UIscrolldemo
//
//  Created by Add on 13-7-15.
//  Copyright (c) 2013年 shinyv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowView : UIView{
    UILabel *contentlable;
    UILabel *timelable;
}


@property(nonatomic,retain)NSString *imageUrl;
@property(nonatomic,retain)NSString *conttextStr;
@property(nonatomic,retain)NSString *timeStr;

@end
