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
    UIButton *btn1 = [UIButton ZTK_fatoryButtonWithFrame:CGRectMake(20, 64, 220, 122) WithTitle:@"请求1" WithTitleColor:[UIColor redColor] Withfont:12 Withimage:nil WithselImage:nil toSuperView:self.view WithClick:^(id sender) {
        [weakSelf btn1];
    }];
    
    
    
    UIButton *btn2 = [UIButton ZTK_fatoryButtonWithFrame:CGRectMake(20, 64, 420, 122) WithTitle:@"请求1" WithTitleColor:[UIColor redColor] Withfont:12 Withimage:nil WithselImage:nil toSuperView:self.view WithClick:^(id sender) {
        [weakSelf btn2];
    }];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)btn1{
    [ZTKTestRequestAPI requestSeckillPayWaWithParameter:nil withSuccess:^(NSString *succMessage, id responseObject, NSInteger succCode) {
        NSLog(@"%@%@%ld",responseObject,(long)succCode);

    } andFailure:^(NSString *errorMessage, id result, NSInteger errorCode) {
        NSLog(@"%@%@%ld",errorMessage,result,(long)errorCode);
    }];
}

-(void)btn2{
    ZTKZTKBJDownItem *item = [ZTKZTKBJDownItem new];
    item.itemType = 2;
    ZTKDownHelperManager *downManger = [[ZTKDownHelperManager alloc]initWithDownItem:item];
    [downManger down];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
