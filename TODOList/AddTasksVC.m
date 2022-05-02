//
//  AddTasksVC.m
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import "AddTasksVC.h"
@interface AddTasksVC ()

@end

@implementation AddTasksVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _task = [Task new];
}

- (IBAction)addNewTask:(id)sender {
    _task.name = _nameTextField.text;
    _task.descTask = _descTextField.text;
    _task.priority = (int)_priorityValue.selectedSegmentIndex;
    _task.status = (int)_statusValue.selectedSegmentIndex;
     
    NSString * dateStr;
    NSDateFormatter * formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd";
    dateStr = [formater stringFromDate:_taskDatePicker.date];
    _task.Date = dateStr;
    
    [_refDelegate didAddTask:_task];
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
