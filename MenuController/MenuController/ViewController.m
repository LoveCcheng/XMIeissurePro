//
//  ViewController.m
//  MenuController
//
//  Created by montnets on 16/9/29.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "ViewController.h"
#import "XMViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    XMViewController *bvc=[[XMViewController alloc]init];
    [self presentViewController:bvc animated:YES completion:nil];

}


@end
