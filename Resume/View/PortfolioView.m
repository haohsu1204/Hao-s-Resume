//
//  PortfolioView.m
//  Resume
//
//  Created by House on 2017/3/28.
//  Copyright © 2017年 House. All rights reserved.
//

#import "PortfolioView.h"
#import "Dimens.h"
#import "Styles.h"

@implementation PortfolioView

- (id)initView{
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"PortfolioView" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    PortfolioView* view = (PortfolioView*)mainView ;
    float ui_val = 1.0f;
    CGRect screen = [[UIScreen mainScreen] bounds];
    if(screen.size.width == IPHONE_5_WIDTH){
        ui_val = IPHONE_5_WIDTH/(IPHONE_6PLUS_WIDTH);
    }
    else if(screen.size.width == IPHONE_6_WIDTH){
        ui_val = IPHONE_6_WIDTH/IPHONE_6PLUS_WIDTH;
    }
    else{
        ui_val = 1;
    }
    CGRect frame = view.frame ;
    frame.size.width =  frame.size.width*ui_val;
    frame.size.height =  frame.size.height*ui_val;
    
    view.icon_l_constraint.constant *= ui_val;
    view.icon_t_constraint.constant *= ui_val;
    view.title_l_constraint.constant *= ui_val;
    view.title_t_constraint.constant *= ui_val;
    view.subtitle_t_constraint.constant *= ui_val;
    view.header1_t_constraint.constant *= ui_val;
    view.header2_t_constraint.constant *= ui_val;
    view.summary1_t_constraint.constant *= ui_val;
    view.summary2_t_constraint.constant *= ui_val;
    view.copyright_t_constraint.constant *= ui_val;
    
    view.frame = frame ;
    
    view.lb_title.font = [UIFont fontWithName:STYLE_TEXT size:view.lb_title.font.pointSize*ui_val];
    view.lb_subtitle.font = [UIFont fontWithName:STYLE_TEXT size:view.lb_subtitle.font.pointSize*ui_val];
    view.lb_hint1.font = [UIFont fontWithName:STYLE_TEXT_BOLD size:view.lb_hint1.font.pointSize*ui_val];
    view.lb_hint2.font = [UIFont fontWithName:STYLE_TEXT_BOLD size:view.lb_hint2.font.pointSize*ui_val];
    view.lb_summary1.font = [UIFont fontWithName:STYLE_TEXT_LIGHT size:view.lb_summary1.font.pointSize*ui_val];
    view.lb_summary2.font = [UIFont fontWithName:STYLE_TEXT_LIGHT size:view.lb_summary2.font.pointSize*ui_val];
    view.lb_copyright.font = [UIFont fontWithName:STYLE_TEXT size:view.lb_copyright.font.pointSize*ui_val];
    
    view.img_icon.layer.cornerRadius = 35*ui_val;
    view.img_icon.layer.masksToBounds = YES ;
    
    
    [view needsUpdateConstraints];
    
    
    
    return mainView;
    
}

- (void)updateColor:(UIColor*)color{
    self.lb_title.textColor = color;
    self.lb_subtitle.textColor = color;
    self.lb_hint1.textColor = color;
    self.lb_hint2.textColor = color;
    self.lb_summary1.textColor = color;
    self.lb_summary2.textColor = color;
    self.lb_copyright.textColor = color;
}

- (void)bindData:(NSDictionary*)data{
    self.lb_title.text = [data objectForKey:@"Title"];
    self.lb_subtitle.text = [data objectForKey:@"SubTitle"];
    self.lb_summary1.text = [data objectForKey:@"Summary1"];
    self.lb_summary2.text = [data objectForKey:@"Summary2"];
    self.lb_copyright.text = [data objectForKey:@"Copyright"];
    
    [self.lb_title sizeToFit];
    [self.lb_summary1 sizeToFit];
    [self.lb_summary2 sizeToFit];
    [self.lb_copyright sizeToFit];
    
    self.img_icon.image = [UIImage imageNamed:[data objectForKey:@"AppIcon"]];
    
    
    
    [self updateColor:[data objectForKey:@"Color"]];
}

@end
