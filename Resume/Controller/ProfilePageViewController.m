//
//  ProfilePageViewController.m
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import "ProfilePageViewController.h"

@interface ProfilePageViewController ()

@end

@implementation ProfilePageViewController{
    int pageIndex;
    NSDictionary* data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initConstrains{
    [super initConstrains];
    
    self.avatar_l_constraint.constant *= ui_val ;
    self.lb_l_constraint.constant *= ui_val ;
    self.lb1_t_constraint.constant *= ui_val ;
    self.lb2_t_constraint.constant *= ui_val ;
    
    [self.view needsUpdateConstraints];
}

- (void)initFonts{
    [super initFonts];
    
    self.lb_title.font = [UIFont systemFontOfSize:self.lb_title.font.pointSize*ui_val];
    self.lb_subTitle1.font = [UIFont systemFontOfSize:self.lb_subTitle1.font.pointSize*ui_val];
    self.lb_subTitle2.font = [UIFont systemFontOfSize:self.lb_subTitle2.font.pointSize*ui_val];
}

- (void)initUI{
    self.lb_title.text = [data objectForKey:@"Title"];
    self.lb_subTitle1.text = [data objectForKey:@"SubTitle1"];
    self.lb_subTitle2.text = [data objectForKey:@"SubTitle2"];
    self.img_avatar.image = [UIImage imageNamed:[data objectForKey:@"Image"]];
    self.img_avatar.layer.cornerRadius = self.img_avatar.frame.size.width/2*ui_val;
    self.img_avatar.layer.masksToBounds = YES ;
    
}

- (void)updateStyles{
    [super updateStyles];
    
    self.lb_subTitle2.textColor = [StyleHelper getPrimaryColor];
}

- (int)getPageIndex{
    return pageIndex;
}

- (void)setPageIndex:(int)_index AndData:(NSDictionary*)_data{
    pageIndex = _index;
    data = _data;
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
