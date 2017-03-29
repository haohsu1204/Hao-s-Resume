//
//  ContactViewController.h
//  Resume
//
//  Created by House on 2017/3/29.
//  Copyright © 2017年 House. All rights reserved.
//

#import "BaseViewController.h"
@import GoogleMaps;

@interface ContactViewController : BaseViewController

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
