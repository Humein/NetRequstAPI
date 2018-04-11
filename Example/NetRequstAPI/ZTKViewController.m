//
//  ZTKViewController.m
//  NetRequstAPI
//
//  Created by shou1wang@gmail.com on 04/10/2018.
//  Copyright (c) 2018 shou1wang@gmail.com. All rights reserved.
//

#import "ZTKViewController.h"
#import "ZTKTestRequestAPI.h"
@interface ZTKViewController ()

@end

@implementation ZTKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [ZTKTestRequestAPI requestSeckillPayWaWithParameter:nil withSuccess:^(NSString *succMessage, id responseObject, NSInteger succCode) {
        
    } andFailure:^(NSString *errorMessage, id result, NSInteger errorCode) {
        
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
