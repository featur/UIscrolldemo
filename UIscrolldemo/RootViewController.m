//
//  RootViewController.m
//  UIscrolldemo
//
//  Created by Add on 13-7-15.
//  Copyright (c) 2013年 shinyv. All rights reserved.
//

#import "RootViewController.h"
#import "ShowView.h"
#import "AppDelegate.h"
@interface RootViewController ()

@end

@implementation RootViewController
//@synthesize sendValue;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadView{
    [super loadView];
    self.view.backgroundColor=[UIColor blueColor];
    //
    mScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 10, 200, 150)];
    mScrollerView.showsHorizontalScrollIndicator=YES;
    mScrollerView.showsVerticalScrollIndicator=NO;
    mScrollerView.pagingEnabled=YES;
    mScrollerView.delegate=self;
    mScrollerView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:mScrollerView];
    mScrollerView.contentSize=CGSizeMake(1000, 150);
    [mScrollerView release];
    //
    mPageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(mScrollerView.frame.origin.x,mScrollerView.frame.size.height+20, 200, 20)];
    mPageControl.numberOfPages = 5;
    mPageControl.enabled = NO;
    [self.view addSubview:mPageControl];
    [mPageControl release];
    //
    UITableView *mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,mPageControl.frame.origin.y+mPageControl.frame.size.height+20 , 320, 300) style:UITableViewStylePlain];
    mTableView.backgroundColor=[UIColor grayColor];
    mTableView.delegate = self;
    mTableView.dataSource = self;
    mTableView.showsVerticalScrollIndicator = NO;
    mTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:mTableView];
    [mTableView release];
    
    
    int (^aBlock)(int)=^(int num2){
        return num2+1;
    };
    float (^distanceTraveled)(float,float,float)=^(float speed ,float accele,float time){
        float distance=(speed * time) + (0.5 * accele * time * time);
        return distance;
    };
     AppDelegate * app=  [UIApplication sharedApplication].delegate;
    NSArray *array=[NSMutableArray array];
   // array=sendValue(app.value);
     array=sendValue();
    NSLog(@"%@",array);
    
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}
#pragma UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * str =@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
       cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    ShowView*mShowView=[[ShowView alloc]init];
    mShowView.frame=CGRectMake(0, 10, 100, 100);
    [cell.contentView addSubview:mShowView];
    
    //cell.textLabel.text=@"dd";
   cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma scrollerdedegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"1");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"2");
     CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;//标记图片滑动的范围，当是某个数是记为上一张 活着下一张；
    mPageControl.currentPage = page;

}
@end
