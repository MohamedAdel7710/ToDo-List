//
//  ViewController.h
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "delegateData.h"
#import "editDelegate.h"
@interface ViewController : UIViewController <delegate,UITableViewDelegate,UITableViewDataSource,editDelegate,UISearchBarDelegate   >
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property NSMutableArray *tasks;

- (IBAction)ChangeView:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *viewOption;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@end

