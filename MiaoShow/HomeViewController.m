
//
//  HomeViewController.m
//  MiaoShow
//
//  Created by jinwei on 16/7/26.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import "HomeViewController.h"
#import "JWSelectedView.h"
#import "JWHotViewController.h"
#import "JWNewStarViewController.h"
#import "ALinCareViewController.h"
#import "JWWebViewController.h"
#import "JWConstant.h"
#import "UIView+JWExtension.h"

@interface HomeViewController() <UIScrollViewDelegate>
/** 顶部选择视图 */
@property(nonatomic, assign) JWSelectedView *selectedView;
/** UIScrollView */
@property(nonatomic, weak) UIScrollView *scrollView;
/** 热播 */
@property(nonatomic, weak) JWHotViewController *hotVc;
/** 最新主播 */
@property(nonatomic, weak) JWNewStarViewController *starVc;
/** 关注主播 */
@property(nonatomic, weak) ALinCareViewController *careVc;

@end

@implementation HomeViewController
- (void)loadView
{
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.contentSize = CGSizeMake(JWScreenWidth * 3, 0);
    view.backgroundColor = [UIColor whiteColor];
    // 去掉滚动条
    view.showsVerticalScrollIndicator = NO;
    view.showsHorizontalScrollIndicator = NO;
    // 设置分页
    view.pagingEnabled = YES;
    // 设置代理
    view.delegate = self;
    // 去掉弹簧效果
    view.bounces = NO;
    
    CGFloat height = JWScreenHeight - 49;
    
    // 添加子视图
    JWHotViewController *hot = [[JWHotViewController alloc] init];
    hot.view.frame = [UIScreen mainScreen].bounds;
    hot.view.height = height;
    [self addChildViewController:hot];
    [view addSubview:hot.view];
    _hotVc = hot;
    
    
    JWNewStarViewController *newStar = [[JWNewStarViewController alloc] init];
    newStar.view.frame = [UIScreen mainScreen].bounds;
    newStar.view.x = JWScreenWidth;
    newStar.view.height = height;
    [self addChildViewController:newStar];
    [view addSubview:newStar.view];
    _starVc = newStar;
    
    ALinCareViewController *care = [UIStoryboard storyboardWithName:NSStringFromClass([ALinCareViewController class]) bundle:nil].instantiateInitialViewController;
    care.view.frame = [UIScreen mainScreen].bounds;
    care.view.x = JWScreenWidth * 2;
    care.view.height = height;
    [self addChildViewController:care];
    [view addSubview:care.view];
    _careVc = care;
    
    self.view = view;
    self.scrollView = view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基本设置
    [self setup];
}

- (void)setup
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_15x14"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"head_crown_24x24"] style:UIBarButtonItemStyleDone target:self action:@selector(rankCrown)];
    [self setupTopMenu];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_selectedView) {
        [self setupTopMenu];
    }
}

- (void)rankCrown
{
    JWWebViewController *web = [[JWWebViewController alloc] initWithUrlStr:@"http://live.9158.com/Rank/WeekRank?Random=10"];
    web.navigationItem.title = @"排行";
    [_selectedView removeFromSuperview];
    _selectedView = nil;
    [self.navigationController pushViewController:web animated:YES];
}

- (void)setupTopMenu
{
    // 设置顶部选择视图
    JWSelectedView *selectedView = [[JWSelectedView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    selectedView.x = 45;
    selectedView.width = JWScreenWidth - 45 * 2;
    [selectedView setSelectedBlock:^(HomeType type) {
        [self.scrollView setContentOffset:CGPointMake(type * JWScreenWidth, 0) animated:YES];
    }];
    [self.navigationController.navigationBar addSubview:selectedView];
    _selectedView = selectedView;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat page = scrollView.contentOffset.x / JWScreenWidth;
    CGFloat offsetX = scrollView.contentOffset.x / JWScreenWidth * (self.selectedView.width * 0.5 - Home_Seleted_Item_W * 0.5 - 15);
    self.selectedView.underLine.x = 15 + offsetX;
    if (page == 1 ) {
        self.selectedView.underLine.x = offsetX + 10;
    }else if (page > 1){
        self.selectedView.underLine.x = offsetX + 5;
    }
    self.selectedView.selectedType = (int)(page + 0.5);
}
@end
