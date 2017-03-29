//
//  PortfolioViewController.h
//  Resume
//
//  Created by House on 2017/3/28.
//  Copyright © 2017年 House. All rights reserved.
//

#import "BaseViewController.h"

@interface PortfolioViewController : BaseViewController

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb1_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lb2_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btn_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btn_r_constraint;

@property (weak, nonatomic) IBOutlet UILabel *lb_copyright;
@property (weak, nonatomic) IBOutlet UILabel *lb_hint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UIImageView *img_bg_front;
@property (weak, nonatomic) IBOutlet UIImageView *img_bg_below;
@property (weak, nonatomic) IBOutlet UIButton *btn_detial;

- (IBAction)on_DetialClick:(id)sender;


@end
