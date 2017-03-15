//
//  ViewController.m
//  AutoLayout(AFL)demo
//
//  Created by 花花一世界 on 17/3/15.
//  Copyright © 2017年 花花一世界. All rights reserved.
//

#import "ViewController.h"
#import "MTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *MTableView;
@property (nonatomic, strong) NSArray *buttonArr;
@property (nonatomic, strong) NSArray *LableArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonArr = [NSArray arrayWithObjects:@"北京香格里拉饭店从去年开始就邀请入住酒店的爱心明星们在酒店的吉祥物小熊童童身上签下他们的名字，加入爱心竞拍的队伍中，截止到现在我们一共筹得爱心款项人民币 24776 元。其中最高的一只明星签名小熊拍价高达10000元人民币。 在北京香格里拉饭店27岁生日的今天，我们在媒体朋友们、启喑实验学校老师和学生及客人们的见证、祝福和陪伴中一起度过了一个意义非凡的生日，爱心传递和善款交付仪式圆满成功！今天的仪式只是我们这个慈善项目的一个开始，会有越来越多的明星朋友加入到其中，也会有更多的签名小熊参与竞拍。这是一场爱的接力赛，希望您和您的朋友都能关注北京香格里拉饭店的官方微信和微博，来参与到我们的竞拍活动中来。爱心“童童”的起拍价为人民币1000元，想要为孩子们奉献一份力量，同时收藏自己偶像签名的爱心人士可致电（8610）6841 2211 转 6901，发邮件至chris.ma@shangri-la.com，微博私信“北京香格里拉饭店”或微信留言等多种方式联系酒店参与竞拍。竞拍金额最高的爱心人士不仅能够得到中意的明星签字“童童”，还将被邀请到之后的活动现场，亲自见",
                      nil];
    
    
    self.MTableView.delegate = self;
    self.MTableView.dataSource = self;
    self.MTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.MTableView registerNib:[UINib nibWithNibName:@"MTableViewCell" bundle:nil] forCellReuseIdentifier:@"MTableViewCell"];
    
    //高度自动适配(只适用于cell极少数量下使用)
    self.MTableView.estimatedRowHeight = 20;
    self.MTableView.rowHeight = UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.buttonArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTableViewCell  *(^block_textCell)()= ^MTableViewCell*() {
        MTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MTableViewCell" forIndexPath:indexPath];
        [cell cellButtonGetText:self.buttonArr[indexPath.row]];
        [cell layoutIfNeeded];
        return cell;
    };
    return block_textCell();
}
@end
