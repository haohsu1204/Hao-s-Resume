//
//  ProfilePageViewController.h
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import "BaseViewController.h"

@interface ProfilePageViewController : BaseViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatar_l_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb_l_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb1_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb2_t_constraint;

@property (weak, nonatomic) IBOutlet UIImageView *img_avatar;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_subTitle1;
@property (weak, nonatomic) IBOutlet UILabel *lb_subTitle2;

-(int)getPageIndex;
-(void)setPageIndex:(int)_index AndData:(NSDictionary*)_data;

@end
