//
//  TimelineCell.h
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line_h_constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line1_v_constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line2_v_constraint;



@property (weak, nonatomic) IBOutlet UIView *view_dot;
@property (weak, nonatomic) IBOutlet UIView *view_dot_border;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_summary;


@end
