//
//  TimelineCell.m
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import "TimelineCell.h"
#import "StyleHelper.h"
#import "Dimens.h"

@implementation TimelineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    float ui_val = 1.0f;
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
    
    
    CGRect frame = self.frame ;
    frame.size.width =  frame.size.width*ui_val; ;
    self.frame = frame ;
    
    self.line_h_constraint.constant *= ui_val;
    self.line1_v_constraint.constant *= ui_val;
    self.line2_v_constraint.constant *= ui_val;
    
    self.view_dot.layer.cornerRadius = self.view_dot.frame.size.width*ui_val/2;
    self.view_dot.layer.masksToBounds = YES;
    self.view_dot_border.layer.cornerRadius = self.view_dot_border.frame.size.width*ui_val/2;
    self.view_dot_border.layer.masksToBounds = YES;
    
    self.lb_title.font = [UIFont boldSystemFontOfSize:self.lb_title.font.pointSize*ui_val];
    self.lb_summary.font = [UIFont systemFontOfSize:self.lb_summary.font.pointSize*ui_val];
    
    self.lb_title.textColor = [StyleHelper getPrimaryColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
