//
//  JWHotViewController.m
//  MiaoShow
//
//  Created by jinwei on 16/8/5.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import "JWHotViewController.h"
#import "JWLive.h"
#import "JWRefreshGifHeader.h"
#import "ALinHotLiveCell.h"
#import "JWTopAD.h"
#import "JWNetworkTool.h"
#import "ALinHomeADCell.h"
#import "JWWebViewController.h"
#import "JWLiveCollectionViewController.h"
#import <MJExtension.h>
#import "UIViewController+JWExtension.h"
#import "UIViewController+JWHUD.h"

@interface JWHotViewController ()
/** 当前页 */
@property(nonatomic, assign) NSUInteger currentPage;
/** 直播 */
@property(nonatomic, strong) NSMutableArray *lives;
/** 广告 */
@property(nonatomic, strong) NSArray *topADS;
@end

static NSString *reuseIdentifier = @"ALinHotLiveCell";
static NSString *ADReuseIdentifier = @"ALinHomeADCell";

@implementation JWHotViewController

- (NSMutableArray *)lives
{
    if (!_lives) {
        _lives = [NSMutableArray array];
    }
    return _lives;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup
{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ALinHotLiveCell class]) bundle:nil] forCellReuseIdentifier:
     reuseIdentifier];
    [self.tableView registerClass:[ALinHomeADCell class] forCellReuseIdentifier:ADReuseIdentifier];
    
    self.currentPage = 1;
    self.tableView.mj_header = [JWRefreshGifHeader headerWithRefreshingBlock:^{
        self.lives = [NSMutableArray array];
        self.currentPage = 1;
        // 获取顶部的广告
        [self getTopAD];
        [self getHotLiveList];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.currentPage++;
        [self getHotLiveList];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)getTopAD
{
    [[JWNetworkTool shareTool] GET:@"http://live.9158.com/Living/GetAD" parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *result = responseObject[@"data"];
        if ([self isNotEmpty:result]) {
            self.topADS = [JWTopAD mj_objectArrayWithKeyValuesArray:result];
            [self.tableView reloadData];
        }else{
            [self showHint:@"网络异常"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showHint:@"网络异常"];
    }];
    
}

- (void)getHotLiveList
{
    [[JWNetworkTool shareTool] GET:[NSString stringWithFormat:@"http://live.9158.com/Fans/GetHotLive?page=%ld", self.currentPage] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        NSArray *result = [JWLive mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        if ([self isNotEmpty:result]) {
            [self.lives addObjectsFromArray:result];
            [self.tableView reloadData];
        }else{
            [self showHint:@"暂时没有更多最新数据"];
            // 恢复当前页
            self.currentPage--;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.currentPage--;
        [self showHint:@"网络异常"];
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.lives.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }
    return 465;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ALinHomeADCell *cell = [tableView dequeueReusableCellWithIdentifier:ADReuseIdentifier];
        if (self.topADS.count) {
            cell.topADs = self.topADS;
            [cell setImageClickBlock:^(JWTopAD *topAD) {
                if (topAD.link.length) {
                    JWWebViewController *web = [[JWWebViewController alloc] initWithUrlStr:topAD.link];
                    web.navigationItem.title = topAD.title;
                    [self.navigationController pushViewController:web animated:YES];
                }
            }];
        }
        return cell;
    }
    ALinHotLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (self.lives.count) {
        JWLive *live = self.lives[indexPath.row-1];
        cell.live = live;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JWLiveCollectionViewController *liveVc = [[JWLiveCollectionViewController alloc] init];
    liveVc.lives = self.lives;
    liveVc.currentIndex = indexPath.row-1;
    [self presentViewController:liveVc animated:YES completion:nil];
}
@end
