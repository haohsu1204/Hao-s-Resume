//
//  PortfolioViewController.m
//  Resume
//
//  Created by House on 2017/3/28.
//  Copyright © 2017年 House. All rights reserved.
//

#import "PortfolioViewController.h"
#import "PortfolioView.h"
#import "MWPhotoBrowser.h"

#define ADJUST_OFFSET 200

@interface PortfolioViewController ()<UIScrollViewDelegate,MWPhotoBrowserDelegate>

@end

@implementation PortfolioViewController{
    NSMutableArray* portfolioData;
    NSMutableArray* screenshotData;
    
    float card_width ;
    float card_height ;
    float btn_padding;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildStaticData];
    [self initUI];
    [self initScrollView];
}

- (void)initConstrains{
    [super initConstrains];
    
    self.lb1_t_constraint.constant *= ui_val ;
    self.lb2_t_constraint.constant *= ui_val ;
    self.btn_t_constraint.constant *= ui_val ;
    self.btn_r_constraint.constant *= ui_val ;
    btn_padding = self.btn_r_constraint.constant;
    self.btn_r_constraint.constant = -self.btn_detial.frame.size.width*ui_val + btn_padding;
    
    [self.view needsUpdateConstraints];
}

- (void)initFonts{
    [super initFonts];
 
    self.lb_copyright.font = [UIFont fontWithName:STYLE_TEXT size:self.lb_copyright.font.pointSize*ui_val];
    self.lb_hint.font = [UIFont fontWithName:STYLE_TEXT size:self.lb_hint.font.pointSize*ui_val];
    
    self.btn_detial.titleLabel.font = [UIFont fontWithName:STYLE_TEXT size:self.btn_detial.titleLabel.font.pointSize*ui_val];

}

- (void)initUI{
    self.lb_copyright.layer.cornerRadius = 15*ui_val;
    self.lb_copyright.layer.masksToBounds = YES ;
    
    CGRect b = self.btn_detial.bounds;
    b.size.height *= ui_val;
    b.size.width *= ui_val;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:b byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft ) cornerRadii:CGSizeMake(15.0*ui_val, 15.0*ui_val)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = b;
    maskLayer.path  = maskPath.CGPath;
    self.btn_detial.layer.mask = maskLayer;
}

- (void)initScrollView{
    
    self.scrollview.delegate = self ;
    
    CGRect frame = self.scrollview.frame;
    card_width = frame.size.width*ui_val;
    card_height = frame.size.height*ui_val;
    
    UIView* container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, card_width, card_height*(1+portfolioData.count))];
    container.backgroundColor = [UIColor clearColor];
    
    for(int i = 0 ; i<portfolioData.count;i++){
        PortfolioView* portfolioView = [[PortfolioView alloc]initView];
        [portfolioView bindData:[portfolioData objectAtIndex:i]];
        portfolioView.frame = CGRectMake(0, (i+1)*card_height, card_width, card_height);
        [container addSubview:portfolioView];
    }
    
    self.scrollview.contentSize = container.frame.size;
    [self.scrollview addSubview:container];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)on_DetialClick:(id)sender {
    [self createPhotos:(int)((UIButton*)sender).tag];
    [self createPhotoBrowser];
}

-(void)createPhotos:(int)page{
    NSMutableArray *screenshots = [[portfolioData objectAtIndex:page]objectForKey:@"ScreenShots"];
    screenshotData = [[NSMutableArray alloc]init];
    for(int i = 0 ;i< screenshots.count;i++){
        [screenshotData addObject:[MWPhoto photoWithImage:[UIImage imageNamed:[screenshots objectAtIndex:i]]]];
    }
}

-(void)createPhotoBrowser{
    // Create browser (must be done each time photo browser is
    // displayed. Photo browser objects cannot be re-used)
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    
    // Set options
    browser.displayActionButton = NO; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = NO; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = YES; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    browser.autoPlayOnAppear = NO; // Auto-play first video
    
    
    // Optionally set the current visible photo before displaying
    [browser setCurrentPhotoIndex:0];
    
    // Present
    [self.navigationController pushViewController:browser animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark – UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    if (scrollView.contentOffset.y < 0 ){
        return ;
    }
    
    [self changeDetailButton:scrollView];
    
    [self changeBackground:scrollView];
    
    if (scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height ){
        return ;
    }
    
    
    [self changeHintAlpha:scrollView.contentOffset.y];
    
    
}

-(void)changeHintAlpha:(float)offset{

    self.lb_copyright.alpha = offset > card_height/2 ? 0 : (card_height/2-offset)/(card_height/2);
    self.lb_hint.alpha = offset > card_height/2 ? 0 : (card_height/2-offset)/(card_height/2);
}

-(void)changeDetailButton:(UIScrollView *)scrollView{
    
    int y_offset = scrollView.contentOffset.y;
    
    int page = y_offset/card_height;
    
    float offset = y_offset-(card_height*page);
    
 
    if(scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height){
        self.btn_r_constraint.constant = btn_padding;
        self.btn_detial.tag = portfolioData.count-1;
    }
    else if(offset>= card_height/2){
        float percent = (offset - card_height/2)/(card_height/2);
        self.btn_r_constraint.constant =self.btn_detial.frame.size.width*(percent-1)+btn_padding;
        self.btn_detial.tag = page;
    }
    else if(page>0 && offset < card_height/2){
        float percent = (card_height/2-offset)/(card_height/2);
        self.btn_r_constraint.constant = self.btn_detial.frame.size.width*(percent-1)+btn_padding;
    }
    else{
        self.btn_r_constraint.constant = self.btn_detial.frame.size.width*(-1)+btn_padding;
    }
}

-(void)changeBackground:(UIScrollView *)scrollView{
    
    int y_offset = scrollView.contentOffset.y;
    
    
    int page = y_offset/card_height;
    
    float offset = y_offset-(card_height*page);
    
    if(scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height){
        self.img_bg_front.image = [UIImage imageNamed:[[portfolioData objectAtIndex:portfolioData.count-1]objectForKey:@"Background"]];
    }
    else if(offset <= card_height/2 ){
        if(page>0){
            self.img_bg_front.image = [UIImage imageNamed:[[portfolioData objectAtIndex:page-1]objectForKey:@"Background"]];
        }
        else{
            self.img_bg_front.image = [UIImage imageNamed:@"bg_default"];
        }
    }
    else{
        if(page>0){
            self.img_bg_below.image = [UIImage imageNamed:[[portfolioData objectAtIndex:page-1]objectForKey:@"Background"]];
            self.img_bg_front.image = [UIImage imageNamed:[[portfolioData objectAtIndex:page]objectForKey:@"Background"]];
        }
        else{
            self.img_bg_front.image = [UIImage imageNamed:[[portfolioData objectAtIndex:page]objectForKey:@"Background"]];
            self.img_bg_below.image = [UIImage imageNamed:@"bg_default"];
        }
    }
    
    if(offset <= card_height/2){
        self.img_bg_front.alpha = 1 ;
    }
    else{
        self.img_bg_front.alpha = (offset-card_height/2)/(card_height/2);
    }
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(!decelerate){
        [self adjustScrollViewOffset:scrollView];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self adjustScrollViewOffset:scrollView];
}


-(void)adjustScrollViewOffset:(UIScrollView*)scrollView{
    int offset = scrollView.contentOffset.y;
    int height = card_height;
    
    if(offset%height<ADJUST_OFFSET*ui_val || offset%height>height-ADJUST_OFFSET*ui_val){
        if(offset%height<ADJUST_OFFSET*ui_val){
            [scrollView setContentOffset:CGPointMake(0, offset-offset%height) animated:YES];
        }
        else{
            [scrollView setContentOffset:CGPointMake(0, offset+height-offset%height) animated:YES];
        }
        
    }
}
#pragma mark – MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return screenshotData.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < screenshotData.count) {
        return [screenshotData objectAtIndex:index];
    }
    return nil;
}

#pragma mark Build Static Data

-(void)buildStaticData{
    portfolioData = [DataHelper buildPortfolioData];
}

@end
