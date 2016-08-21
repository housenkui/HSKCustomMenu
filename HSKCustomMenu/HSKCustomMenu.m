//
//  HSKCustomMenu.m
//  HSKCustomMenu
//
//  Created by 二哈 on 16/2/18.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import "HSKCustomMenu.h"

@implementation HSKCustomMenu
- (instancetype)initWithTitleArray:(NSArray *)titleArr imageArr:(NSArray *)imageArr rowHeight:(CGFloat)rowHeight rowWidth:(CGFloat)rowWidth origin:(CGPoint)origin{
    
    if (self  =[super initWithFrame:[UIScreen mainScreen].bounds]) {
        
    
    self.titleArr  =titleArr;
    self.imageArr  =imageArr;
    self.backgroundColor =[UIColor clearColor];
        
    
    self.tableView  =[[UITableView alloc]initWithFrame:CGRectMake(10+origin.x, 10+origin.y, rowWidth, titleArr.count*rowHeight) style:UITableViewStylePlain];
        
    self.tableView.backgroundColor =[UIColor colorWithWhite:0.3 alpha:1];
        self.tableView.layer.cornerRadius  =2;
    self.tableView.delegate  =self;
    self.tableView.dataSource =self;
    self.tableView.bounces = NO;
    [self addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HSK"];
        
    }
    return self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:@"HSK"];
    
    cell.textLabel.textColor =[UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text  = self.titleArr[indexPath.row];
    
    cell.textLabel.font =[UIFont systemFontOfSize:15];
    cell.imageView.image  =[UIImage imageNamed:self.imageArr[indexPath.row]];
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor =[UIColor blackColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(hskCustomMenuTableView:didSelectRowAtIndexPath:)]) {
        
        [self.delegate hskCustomMenuTableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    [self disMissCompletion:nil];
    
    
}
- (void)disMissCompletion:(Diss)diss{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha=0;
        self.tableView.frame = CGRectMake(10, 10, 0, 0);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        self.diss();
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (![touch.view isEqual:self.tableView]) {
        
        [self disMissCompletion:nil];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    NSString *string = [[NSString alloc]initWithFormat:@"%@",@"测试"];
    
    CGContextRef context =  UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 25,5);
    CGContextAddLineToPoint(context, 20, 10);
    CGContextAddLineToPoint(context, 30, 10);
    CGContextClosePath(context);
    [self.tableView.backgroundColor setFill];
    CGContextDrawPath(context, kCGPathFill);
    
}


@end
