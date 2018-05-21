//
//  ZTKViewController.m
//  NetRequstAPI
//
//  Created by shou1wang@gmail.com on 04/10/2018.
//  Copyright (c) 2018 shou1wang@gmail.com. All rights reserved.
//
#define Weak_Self __weak typeof(self) weakSelf = self;

#import "ZTKViewController.h"
#import "ZTKTestRequestAPI.h"
#import "UIButton+ButtonBlockCategory.h"
#import "ZTKDownHelperManager.h"
#import "ZTKZTKBJDownItem.h"
@interface ZTKViewController ()
@end

@implementation ZTKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof (self) weakSelf = self;

    UIButton *button = [UIButton createButtonWithFrame:CGRectMake(20, 100, 44, 44) title:@"开始" titleColor:[UIColor redColor] bgImageName:@"" actionBlock:^(UIButton *button) {

        [weakSelf btn1];

    }];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton createButtonWithFrame:CGRectMake(64, 100, 44, 44) title:@"停止" titleColor:[UIColor redColor] bgImageName:@"" actionBlock:^(UIButton *button) {

        [weakSelf btn3];
        
    }];
    [self.view addSubview:button1];
    
    
    UIButton *btn = [UIButton button];
    btn.frame = CGRectMake(20, 300, 200, 200);
    [btn setTitle:@"1234" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    btn.actionBlock = ^(UIButton *button) {
//        NSString *str = [button titleForState:UIControlStateNormal];
//        NSLog(@"%@",str);
        [weakSelf btn2];
    };
    [self.view addSubview:btn];
    

    

//
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)btn1{
//    [ZTKTestRequestAPI requestSeckillPayWaWithParameter:nil withSuccess:^(NSString *succMessage, id responseObject, NSInteger succCode) {
//        NSLog(@"%@%@%ld",responseObject,(long)succCode);
//
//    } andFailure:^(NSString *errorMessage, id result, NSInteger errorCode) {
//        NSLog(@"%@%@%ld",errorMessage,result,(long)errorCode);
//    }];
    ZTKZTKBJDownItem *item = [ZTKZTKBJDownItem new];
    item.itemType = 1;
    [[ZTKDownHelperManager sharedDownVideoManager] downLoadDownItem:item];
    [[ZTKDownHelperManager sharedDownVideoManager] down];
}

-(void)btn3{
    [[ZTKDownHelperManager sharedDownVideoManager] pause];
}

-(void)btn2{
    ZTKZTKBJDownItem *item = [ZTKZTKBJDownItem new];
    item.itemType = 2;
    [[ZTKDownHelperManager sharedDownVideoManager] downLoadDownItem:item];
    [[ZTKDownHelperManager sharedDownVideoManager] down];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
