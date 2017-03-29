//
//  ContactViewController.m
//  Resume
//
//  Created by House on 2017/3/29.
//  Copyright © 2017年 House. All rights reserved.
//

#import "ContactViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

#define LATITUDE 25.083009
#define LONGTITUDE 121.605262
#define DEFAULT_ZOOM 16
#define PHONE @"+886939151022"
#define EMAIL @"haohsu1204@gmail.com.tw"


@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate>

@end

@implementation MFMailComposeViewController (IOS7_StatusBarStyle)

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(UIViewController *)childViewControllerForStatusBarStyle
{
    return nil;
}

@end

@implementation ContactViewController{
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self  initGoogleMap];
    [self initTableView];
}

- (void)initGoogleMap{

    // Create a GMSCameraPosition that tells the map to display
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:LATITUDE
                                                            longitude:LONGTITUDE
                                                                 zoom:DEFAULT_ZOOM];
   
    self.mapView.camera = camera ;
    self.mapView.myLocationEnabled = YES;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(LATITUDE, LONGTITUDE);
    marker.title = @"Neihu Dist., Taipei City 114";
    marker.snippet = @"Taiwan (R.O.C.)";
    marker.map = self.mapView;
    
}

-(void)initTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.delegate = self ;
    self.tableView.dataSource = self ;
    self.tableView.allowsSelection = YES ;
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

#pragma mark – UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"icon_location"];
            cell.textLabel.text = @"Neihu Dist., Taipei City 114 Taiwan";
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"icon_phone"];
            cell.textLabel.text = PHONE;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"icon_mail"];
            cell.textLabel.text = EMAIL;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            break;
            
    }
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [StyleHelper getAccentColor];
    cell.textLabel.font = [UIFont fontWithName:STYLE_TEXT_LIGHT size:cell.textLabel.font.pointSize*ui_val];
    
    return cell;
}

#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
            [self sendLocation];
            break;
        case 1:
            [self sendCall];
            break;
        case 2:
            [self sendEmail];
            break;
        default:
            break;
            
    }
}

- (void)sendLocation{
    [self.mapView animateToLocation:CLLocationCoordinate2DMake(LATITUDE, LONGTITUDE)];
    [self.mapView animateToZoom:DEFAULT_ZOOM];
}

- (void)sendCall{
    UIAlertController * view=   [UIAlertController
                                 alertControllerWithTitle:@"Warning"
                                 message:@"Ensure to call this number?"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Call"
                         style:UIAlertActionStyleDestructive
                         handler:^(UIAlertAction * action)
                         {
                             [view dismissViewControllerAnimated:YES completion:nil];
                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",PHONE]] options:@{} completionHandler:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    
    [view addAction:ok];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
    
}

- (void)sendEmail{
    if ([MFMailComposeViewController canSendMail])
    {
        NSString *emailTitle =  @"From:【Hao's Resume APP】";
        
        NSString *messageBody = @"Hi there";
        
        NSArray *toRecipents = [NSArray arrayWithObject:EMAIL];
        
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        [mc.navigationBar setTintColor:[StyleHelper getAccentColor]];
        mc.mailComposeDelegate = self;
        
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        
        
        [mc setToRecipients:toRecipents];
        
        [self presentViewController:mc animated:YES completion:nil];
    }
    else
    {
        //TODO: Add Custom Toast Later
        NSLog(@"This device cannot send email");
    }
}

#pragma mark – MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
