//
//  HSKCustomMenu.h
//  HSKCustomMenu
//
//  Created by 二哈 on 16/2/18.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol hskCustomMenuDelegate <NSObject>

@required
- (void)hskCustomMenuTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
typedef void(^Diss)() ;
@interface HSKCustomMenu : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic,assign)id <hskCustomMenuDelegate>delegate;
@property (nonatomic,copy)Diss diss;

@property (nonatomic,assign)CGFloat rowHeight;

@property (nonatomic,assign)CGFloat rowWidth;

- (instancetype)initWithTitleArray:(NSArray *)titleArr imageArr:(NSArray *)imageArr rowHeight:(CGFloat )rowHeight rowWidth:(CGFloat)rowWidth origin:(CGPoint )origin;

- (void)disMissCompletion:(Diss)diss;


@end
