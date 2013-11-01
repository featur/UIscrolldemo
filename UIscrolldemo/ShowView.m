//
//  ShowView.m
//  UIscrolldemo
//
//  Created by Add on 13-7-15.
//  Copyright (c) 2013年 shinyv. All rights reserved.
//

#import "ShowView.h"

@implementation ShowView
@synthesize imageUrl,conttextStr,timeStr;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView*imageView=[[UIImageView alloc]init];
        imageView.frame=CGRectMake(20, 10, 100, 80);
        imageView.backgroundColor=[UIColor clearColor];
        imageView.image=[UIImage imageNamed:@"cellPicture"];
        imageView.userInteractionEnabled=YES;
        [self addSubview:imageView];
        
        [imageView release];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(5,+imageView.frame.size.height-30, 30, 25);
        [btn addTarget:self action:@selector(ShowAction:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];
    
        contentlable=[self createLabel:@"share" withFont:15.0];
        contentlable.frame=CGRectMake(imageView.frame.origin.x,imageView.frame.origin.y+imageView.frame.size.height-8, 100, 30);
        [self addSubview:contentlable];
        timelable=[self createLabel:@"time" withFont:11.0];
        timelable.frame=CGRectMake(contentlable.frame.origin.x,contentlable.frame.origin.y+contentlable.frame.size.height-8, 100, 30);
        
        [self addSubview:timelable];
       
    }
    return self;
}
-(UILabel*)createLabel:(NSString*)text withFont:(CGFloat)font{
    UILabel*mLable=[[[UILabel alloc]init]autorelease];
    mLable.text=text;
    mLable.backgroundColor=[UIColor  clearColor];
    mLable.font=[UIFont systemFontOfSize:font];
    mLable.textAlignment=NSTextAlignmentLeft;
    return mLable ;
}
-(void)ShowAction:(id)sender{
    UIButton *btn=(UIButton *)sender;
    NSLog(@"sender%d",btn.tag);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
