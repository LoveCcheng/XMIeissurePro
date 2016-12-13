//
//  XMlabel.m
//  MenuController
//
//  Created by montnets on 16/9/29.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMlabel.h"

@implementation XMlabel

-(void)awakeFromNib{
    [self setUpLabel];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
    [self setUpLabel];
    }
    return self;
}

-(void)setUpLabel{
    self.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)];
    [self addGestureRecognizer:tap];
}

/**
 *  能否成为第一响应者
 *
 *  @return yes
 */
-(BOOL)canBecomeFirstResponder{
    return YES;
}
/**
 *  点击label能执行那种操作
 *
 *  @param action action执行操作的类型
 *  @param sender <#sender description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    NSLog(@"%@",NSStringFromSelector(action));
    if (action==@selector(cut:) || action == @selector(copy:) || action == @selector(paste:)) {
        return YES;
    }
    return NO;
}

-(void)cut:(UIMenuController *)menu{
//    NSLog(@"%s,%@",__func__,menu);
    //剪贴,将label文字放到剪贴板
    UIPasteboard *board=[UIPasteboard generalPasteboard];
    board.string=self.text;
    //清空label
    self.text=nil;
}
-(void)copy:(UIMenuController *)menu{
//    NSLog(@"%s,%@",__func__,menu);
    //将label文字放到剪贴板
    UIPasteboard *board=[UIPasteboard generalPasteboard];
    board.string=self.text;
    
}
-(void)paste:(UIMenuController *)menu{
//     NSLog(@"%s,%@",__func__,menu);
     UIPasteboard *board=[UIPasteboard generalPasteboard];
    self.text=board.string;
    
}

-(void)labelClick{
//    NSLog(@"%s",__func__);
    //成为第一响应者
    [self becomeFirstResponder];
    UIMenuController *menu=[UIMenuController sharedMenuController];
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];

}


@end
