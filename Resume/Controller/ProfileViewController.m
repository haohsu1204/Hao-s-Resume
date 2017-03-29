//
//  ProfileViewController.m
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfilePageViewController.h"
#import "TimelineCell.h"



@interface ProfileViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>


@end

@implementation ProfileViewController{
    UIPageViewController * pageController;
    int currentPageIndex;
    NSMutableArray* profileData;
    NSMutableArray* profileDetialData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildStaticData];
    [self initTableView];
    [self initPager];
}

-(void)initTableView{
    [self.tableView registerNib:[UINib nibWithNibName:@"TimelineCell" bundle:nil] forCellReuseIdentifier:@"TimelineCell"];
    self.tableView.delegate = self ;
    self.tableView.dataSource = self ;
    self.tableView.allowsSelection = NO ;
}

-(void)initPager
{
    pageController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageController.dataSource = self;
    pageController.delegate = self;
    [[pageController view] setFrame:self.view_page_container.bounds];
    
    BaseViewController *viewController = [self currentViewController:currentPageIndex];
    NSArray * viewControllers = [NSArray arrayWithObject:viewController];
    
    [pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    [self addChildViewController:pageController];
    [self.view_page_container addSubview:[pageController view]];
    [pageController didMoveToParentViewController:self];
    
    [self reloadTableView];

}

- (void)reloadTableView{
    profileDetialData = [[profileData objectAtIndex:currentPageIndex]objectForKey:@"Detial"];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
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


#pragma mark UIPageViewControllerDataSource

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return profileData.count;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    ProfilePageViewController* vc = (ProfilePageViewController*)viewController ;
    int index = [vc getPageIndex];
    if(index == 0){
        return nil;
    }
    else{
        index -- ;
        return [self currentViewController:index];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    ProfilePageViewController* vc = (ProfilePageViewController*)viewController ;
    int index = [vc getPageIndex];
    if(index == profileData.count-1){
        return nil;
    }
    else{
        index ++ ;
        return [self currentViewController:index];
    }
}

- (ProfilePageViewController *)currentViewController:(int)index
{
    ProfilePageViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfilePageViewController"];
    [vc setPageIndex:index AndData:[profileData objectAtIndex:index]];
    return vc ;
}

#pragma mark UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (!completed)
    {
        // You do nothing because whatever page you thought
        // the book was on before the gesture started is still the correct page
        return;
    }
    
    ProfilePageViewController* vc = (ProfilePageViewController*)[pageViewController.viewControllers objectAtIndex:0];
    currentPageIndex = [vc getPageIndex];
    //Reload TableView
    [self reloadTableView];
}

#pragma mark – UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return profileDetialData.count;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 77.0*ui_val;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = [profileDetialData objectAtIndex:indexPath.row];
    TimelineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineCell"];
    
    if (cell == nil) {
        cell = [[TimelineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TimelineCell"];
    }
    
    cell.lb_title.text = [item objectForKey:@"Title"];
    cell.lb_summary.text = [item objectForKey:@"Summary"];
    [cell.lb_summary sizeToFit];
    
    return cell;
}

#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark Build Static Data

-(void)buildStaticData{
    profileData = [DataHelper buildProfileData];
}


@end
