//
//  RecreationController.m
//  zhibo_pro
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 xiaojun. All rights reserved.
//

#import "RecreationController.h"
#import "RecreationViewController.h"
#import "RecreationCell.h"

@interface RecreationController ()<UIScrollViewDelegate>


@property(strong, nonatomic )UIScrollView *scrollView;//轮播图
@property(strong, nonatomic)UIPageControl *pageControl;//翻书页
@property(strong, nonatomic)NSTimer *timer; //计时器

@end

#define KWidth (self.view.frame.size.width)
#define kHeight 200


@implementation RecreationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"娱乐";
    
    //1.创建并初始化
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KWidth, 200)];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake(KWidth * 3, 200);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    
    for (int i = 0; i < 3; i++) {
        _scrollView.delegate = self;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]]];
        imageView.frame = CGRectMake(0, 0, KWidth, 200);
        //将图片对象添加到滚动视图上
        [_scrollView addSubview:imageView];
    }
    
    [self.view addSubview:_scrollView];

    
//    //1创建并初始化
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, kWidth, kHeight)];
//    //设置属性
//    scrollView.backgroundColor = [UIColor redColor];
//    scrollView.contentSize = CGSizeMake(kWidth * 4, kHeight);
//    
//    _scrollView.pagingEnabled = YES;
//
//    //添加代理
//    self.scrollView.delegate = self;
//    
//    for (int i =1; i<=4 ; i++) {
//         UIScrollView *scView = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * (i - 1), 0, kWidth, kHeight)];
//        scView.delegate = self;
//        scView.minimumZoomScale = 0.5;
//        scView.maximumZoomScale = 2;
//    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"1%d.jpg", i + 1]]];
//        imgView.frame = CGRectMake(0, 0, kWidth, kHeight);
//        
//        [scView addSubview:imgView];//将图片添加到小的滚动视图上
//        [scrollView addSubview:scView];//将小的scrollView添加到打的scrollView上
    
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(200, 500, 114, 40)];
    pageControl.numberOfPages = 4;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    //给pageControl添加事件,使用pageControl控制scrollView的播放
    [pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    _pageControl = pageControl;
    
   self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

}

-(void)pageControlClick:(UIPageControl *)sender
{
    //现获取pageControl显示的页数
    NSInteger currentPage = sender.currentPage;
    //再设置滚动视图的偏移
    _scrollView.contentOffset = CGPointMake(KWidth * currentPage, 0);
}



//Timer设置滚动视图
int a = 0;
- (void)timerAction{
    
    a++;
    if (a == 4) {
        a = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(414 * a , 0)];
    [self.pageControl setCurrentPage:a];
}

////关联scorellView和pageControl
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    
//    self.pageControl.currentPage = self.scrollView.contentOffset.x / 414.0;
//    
//}
//-(void)changPage:(UIPageControl *)sender{
//    
//    NSInteger num = self.pageControl.currentPage;
//    
//    self.scrollView.contentOffset = CGPointMake(414 * num, 0);
//    
//}
//


//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 0;
//}

//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    RecreationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//
//    cell.textLabel.text = @"测试";

//    
//    return cell;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
