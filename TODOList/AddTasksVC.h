//
//  AddTasksVC.h
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "delegateData.h"
#import "Task.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddTasksVC : UIViewController

@property id<delegate>   refDelegate;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property Task *task;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDatePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityValue;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusValue;


@end

NS_ASSUME_NONNULL_END
