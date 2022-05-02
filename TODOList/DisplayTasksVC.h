//
//  DisplayTasksVC.h
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "editDelegate.h"

@interface DisplayTasksVC : UIViewController 

@property Task *taskData;
@property (weak, nonatomic) IBOutlet UIImageView *priority;
@property (weak, nonatomic) IBOutlet UITextField *titleTF;
@property (weak, nonatomic) IBOutlet UITextField *descTF;
@property (weak, nonatomic) IBOutlet UILabel *priorytLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySeg;
@property int index;
@property id<editDelegate> refObje;

@property (weak, nonatomic) IBOutlet UISegmentedControl *statusUpdate;





@property (weak, nonatomic) IBOutlet UIDatePicker *TaskDate;
@property (weak, nonatomic) IBOutlet UITextField *dateTF;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *applyButton;
@property (weak, nonatomic) IBOutlet UITextField *statusTF;



@end
