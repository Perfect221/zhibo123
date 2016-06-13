//
//  PersonController.m
//  zhibo_pro
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 xiaojun. All rights reserved.
//

#import "PersonController.h"
#import "PersonView.h"
@interface PersonController ()<UITableViewDelegate,UITableViewDataSource>

// 获取屏幕宽高
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

// 作为 TableView 的数据源
@property(strong, nonatomic)NSArray *listArray;



@end

@implementation PersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人用户";
    
    //初始化数据源
    _listArray = @[@"❤️我的收藏",@"✨我的相册",@"⭐️意见反馈"];
    //初始化控件
    self.personListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT - 64) style:UITableViewStylePlain];
    //清楚多余的分割线
    self.personListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    
    //设置代理
    self.personListTableView.dataSource = self;
    self.personListTableView.delegate = self;
    
    //设置头视图
    self.personHeanderView = [[PersonView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 120)];
    self.personListTableView.tableHeaderView = self.personHeanderView;
    
    [self.view addSubview:_personListTableView];
    
    //注册
    [self.personListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

    
}






-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _listArray[indexPath.row];
    return cell;
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
