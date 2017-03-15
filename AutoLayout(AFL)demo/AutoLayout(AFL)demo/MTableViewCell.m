//
//  MTableViewCell.m
//  AutoLayout(VFL)-tableviewDemo
//
//  Created by 花花一世界 on 17/3/14.
//  Copyright © 2017年 花花一世界. All rights reserved.
//

#import "MTableViewCell.h"

@implementation MTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)cellLableGetText:(NSString *)contentText{
    UILabel* Textlabel =[[UILabel alloc] init];
    Textlabel.text=contentText;
    Textlabel.numberOfLines=0;
    Textlabel.lineBreakMode = NSLineBreakByWordWrapping;
    Textlabel.translatesAutoresizingMaskIntoConstraints=NO; //使用VFL布局约束要加这一句,不然会报错
    [self.contentView addSubview:Textlabel];
    //纯代码添加水平方向约束
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[Textlabel]-|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(Textlabel)];
    //纯代码添加垂直方向约束
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[Textlabel]-8-|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(Textlabel)];
    /*format: 是VFL字符串。
     opts：设置VFL语句中的视图相互间的对齐方式，一般默认传0即可。
     metrics：字典。一般是把VFL字符串中涉及到的高度、宽带等数据参数转为字典存到metrics中。在format中，高度、宽度等数据参数就用metrics中的key代替，然后编译器解析时会自动替换metrics中的值 value。
     views:  字典。把format中所有相关的视图控件放入这个字典。
     */
    [self.contentView addConstraints:constraints1];
    [self.contentView addConstraints:constraints2];

}
-(void)cellButtonGetText:(NSString *)contentText{
    UIButton *Textbutton = [[UIButton alloc] init];
    Textbutton.backgroundColor = [UIColor clearColor];
    [Textbutton setTitle:contentText forState:UIControlStateNormal];
    [Textbutton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    Textbutton.titleLabel.font = [UIFont systemFontOfSize:15];
    Textbutton.titleLabel.numberOfLines = 0;
    Textbutton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    Textbutton.translatesAutoresizingMaskIntoConstraints = NO; //使用VFL布局约束要加这一句,不然会报错
    [Textbutton sizeToFit];
    [Textbutton layoutIfNeeded];
    [self.contentView addSubview:Textbutton];

    
    CGSize expectedSize = [Textbutton.titleLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0)];
    
    //算出文字适配宽度后的高度,传入到约束里
    NSDictionary *metrics = @{@"lableHeight": @(expectedSize.height)};
    
    //纯代码添加水平方向约束
    NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[Textbutton]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(Textbutton)];
    //纯代码添加垂直方向约束
    NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[Textbutton(lableHeight)]-8-|" options:0 metrics:metrics views:NSDictionaryOfVariableBindings(Textbutton)];
    
    /*format: 是VFL字符串。
     opts：设置VFL语句中的视图相互间的对齐方式，一般默认传0即可。
     metrics：字典。一般是把VFL字符串中涉及到的高度、宽带等数据参数转为字典存到metrics中。在format中，高度、宽度等数据参数就用metrics中的key代替，然后编译器解析时会自动替换metrics中的值 value。
     views:  字典。把format中所有相关的视图控件放入这个字典。
     */
    [self.contentView addConstraints:constraintsH];
    [self.contentView addConstraints:constraintsV];
    [super layoutSubviews];
}
@end
