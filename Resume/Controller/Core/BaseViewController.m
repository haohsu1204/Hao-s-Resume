//
//  BaseViewController.m
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import "BaseViewController.h"
#import "Dimens.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initConstrains];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self updateStyles];
}



- (void)initConstrains{
    CGRect screen = [[UIScreen mainScreen] bounds];
    if(screen.size.width == IPHONE_5_WIDTH){
        ui_val = IPHONE_5_WIDTH/IPHONE_6PLUS_WIDTH;
    }
    else if(screen.size.width == IPHONE_6_WIDTH){
        ui_val = IPHONE_6_WIDTH/IPHONE_6PLUS_WIDTH;
    }
    else{
        ui_val = 1;
    }
    [self initFonts];
}

- (void)initFonts{
    //Override by SubClass
}

- (void)updateStyles{
    //TODO:New feature :
    //Update Styles from Settings.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
