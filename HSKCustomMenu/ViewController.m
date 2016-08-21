//
//  ViewController.m
//  HSKCustomMenu
//
//  Created by 二哈 on 16/8/21.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import "ViewController.h"
#import "HSKCustomMenu.h"
@interface ViewController ()<hskCustomMenuDelegate>
@property (nonatomic,strong)HSKCustomMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent  =NO;
    self.navigationItem.leftBarButtonItem  =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"schoolListItem"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenuList:)];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)showMenuList:(UIBarButtonItem *)barButtonItem{
    
    if (!self.menu) {
        __weak __typeof(self) weakSelf = self;
        NSArray *titles  = @[@"附近学校", @"联赛流程", @"其他联赛", @"校内群聊", @"邀请好友"];
        NSArray *images = @[@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
        
        self.menu  =[[HSKCustomMenu alloc]initWithTitleArray:titles imageArr:images rowHeight:44 rowWidth:125 origin:CGPointMake(0, 0)];
        self.menu.delegate  =self;
        
        self.menu.diss= ^{
            
            weakSelf.menu  =nil;
        };
        [self.view addSubview:self.menu];
    }
    else{
        
        [self.menu disMissCompletion:nil];
    }
}
- (void)hskCustomMenuTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击:%ld",indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end