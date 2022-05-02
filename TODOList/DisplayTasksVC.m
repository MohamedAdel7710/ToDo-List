//
//  DisplayTasksVC.m
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import "DisplayTasksVC.h"

@interface DisplayTasksVC ()

@end

@implementation DisplayTasksVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _taskData.name;
    if(_taskData.priority == 0)
    {
        _priority.image = [UIImage imageNamed:@"high.png"];
    }
    else if(_taskData.priority == 1)
    {
        _priority.image = [UIImage imageNamed:@"medium.png"];
    }
    else if(_taskData.priority == 2)
    {
        _priority.image = [UIImage imageNamed:@"low.png"];
    }
    _titleTF.text = _taskData.name;
    _descTF.text = _taskData.descTask;
    _dateTF.text = _taskData.Date;
    _statusTF.text = (_taskData.status == 0)? @"TODO" : (_taskData.status ==1)? @"In Progress" : @"Done";
    
}
- (IBAction)editData:(id)sender {
   
    
    //UI
    
    _descTF.enabled = YES;
    _titleTF.enabled = YES;
    
    _priorytLabel.hidden = NO;
    _prioritySeg.hidden = NO;
    
    _dateTF.hidden=YES;
    _TaskDate.hidden = NO;
    if(_taskData.status != 2)
    {
        _statusTF.hidden = YES;
        _statusUpdate.hidden = NO;
    }
    
    _cancelButton.hidden = NO;
    _applyButton.hidden = NO;
    
    
    
}
- (IBAction)backToHome:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)applyEdit:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Are you sure you want to edit" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *Yes = [UIAlertAction actionWithTitle:@"Yes I'm Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        self.taskData.name = self.titleTF.text;
        self.taskData.descTask = self.descTF.text;
        self.taskData.priority =(int) self.prioritySeg.selectedSegmentIndex;
        self.taskData.status = (int) self.statusUpdate.selectedSegmentIndex+1;
        NSString * dateStr;
        NSDateFormatter * formater = [NSDateFormatter new];
        formater.dateFormat = @"yyyy-MM-dd";
        dateStr = [formater stringFromDate:self.TaskDate.date];
        self.taskData.Date = dateStr;
        [self.refObje editObject: self.index:self.taskData];
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    
    UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"No Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:Yes];
    [alert addAction:Cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
    
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
