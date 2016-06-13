//
//  RootViewController.m
//  zhibo_pro
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 xiaojun. All rights reserved.
//

#import "RootViewController.h"
#import "LiveController.h"  //直播
#import "RecreationController.h"  //娱乐
#import "SearchController.h"  //搜索
#import "PersonController.h"   //个人

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //设置tabbar文本标题颜色
    [self setTabBarTextAtrribute];
    
    //添加4个子视图控制器
    [self createChildViewControllers];
  
    
}

//设置tabbar 文本的标题颜色
-(void)setTabBarTextAtrribute{
    //设置普通状态下,文本标题颜色
    NSMutableDictionary *normalDic = [NSMutableDictionary dictionary];
    normalDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //设置选中状态下文本标题颜色
    NSMutableDictionary *selectDic = [NSMutableDictionary dictionary];
    selectDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    //配置文本属性
    UITabBarItem *buttonItem = [UITabBarItem appearance];
    [buttonItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [buttonItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    
}

/*
 * 给 TabBarController   添加一个子视图控制器
 
 * @param viewController 添加的子视图控制器
 * @param title          名称
 * @param normalImg      普通状态下的图片
 * @param selectImg      选中状态下的图片
 */

//添加4个控制器图片
-(void)addOneChildViewController:(UIViewController *)viewController Title:(NSString *)title NormalImage:(NSString *)normalImg SelectImage:(NSString *)selectImg
{
    //给子视图控制器的tabbarItem赋值
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:normalImg];
    
    UIImage *image = [UIImage imageNamed:selectImg];
    
    //设置渲染模式(本身的样子)
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage =image;
    //把子视图控制器添加上去
    [self addChildViewController:viewController];
    
}

-(void)createChildViewControllers{
    //直播
    LiveController *LiveVC = [[LiveController alloc]initWithStyle:UITableViewStylePlain];
      [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:LiveVC] Title:@"直播" NormalImage:@"5" SelectImage:@"4"];
    
 
    //娱乐
    RecreationController *recreationVC = [[RecreationController alloc]initWithStyle:UITableViewStylePlain];
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:recreationVC] Title:@"娱乐" NormalImage:@"2" SelectImage:@"3"];
    
    //搜索
    SearchController *searchVC = [[SearchController alloc]init];
     [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:searchVC] Title:@"搜索" NormalImage:@"6" SelectImage:@"1"];
    
    
    //个人
    PersonController *personVC = [[PersonController alloc]init];
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:personVC] Title:@"个人" NormalImage:@"person@2x.png" SelectImage:@"personH.png"];
    
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
