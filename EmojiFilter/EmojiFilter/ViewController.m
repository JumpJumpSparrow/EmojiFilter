//
//  ViewController.m
//  EmojiFilter
//
//  Created by suning on 2018/12/23.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "ViewController.h"
#import "NSString+emojiFilter.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UITableView *table;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UISearchController *search = [[UISearchController alloc]initWithSearchResultsController:nil];
    search.hidesNavigationBarDuringPresentation = NO;
    search.dimsBackgroundDuringPresentation = NO;
    
    search.searchResultsUpdater = self;
    search.delegate = self;
    
    search.searchBar.delegate = self;
    
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"emojiFilter"];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    table.tableHeaderView = search.searchBar;
    search.searchBar.showsCancelButton = NO;
    self.searchController = search;
    self.table = table;
}


//***************

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
//    BOOL con = [text containsEmoji];
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [self.dataSource removeAllObjects];
    
    [self.dataSource addObject:searchBar.text];
    [self.dataSource addObject:[searchText removeEmoji]];
    
    searchBar.text = [searchText removeEmoji];
    
    [self.table reloadData];
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"emojiFilter"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44.0f;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
