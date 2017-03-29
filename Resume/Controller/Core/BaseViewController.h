//
//  BaseViewController.h
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyleHelper.h"
#import "DataHelper.h"


@interface BaseViewController : UIViewController
{
    float ui_val;
    float ui_font;
}

- (void)initConstrains;
- (void)initFonts;

- (void)updateStyles;

@end
