//
//  PortfolioView.h
//  Resume
//
//  Created by House on 2017/3/28.
//  Copyright © 2017年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortfolioView : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_l_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_t_constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *title_l_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *title_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subtitle_t_constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *header1_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *header2_t_constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summary1_t_constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summary2_t_constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *copyright_t_constraint;

@property (weak, nonatomic) IBOutlet UIImageView *img_icon;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_subtitle;
@property (weak, nonatomic) IBOutlet UILabel *lb_hint1;
@property (weak, nonatomic) IBOutlet UILabel *lb_hint2;
@property (weak, nonatomic) IBOutlet UILabel *lb_summary1;
@property (weak, nonatomic) IBOutlet UILabel *lb_summary2;
@property (weak, nonatomic) IBOutlet UILabel *lb_copyright;

-(id)initView;
- (void)bindData:(NSDictionary*)data;

@end
