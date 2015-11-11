//
//  BDListViewController.m
//  Buddhism
//
//  Created by Vincent on 15/11/10.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "BDListViewController.h"
#import "BDListTableViewCell.h"
#import "BDPlayViewController.h"
@interface BDListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation BDListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return _orderProducts.count;
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BDListTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //[cell initCellWith:_orderProducts[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BDPlayViewController *productDetailViewController = [[BDPlayViewController alloc] initWithNibName:@"BDPlayViewController" bundle:nil];
    
    [self.navigationController pushViewController:productDetailViewController animated:YES];
}
@end
