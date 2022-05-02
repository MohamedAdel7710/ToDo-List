//
//  ViewController.m
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import "ViewController.h"
#import "AddTasksVC.h"
#import "DisplayTasksVC.h"
#import "Task.h"

@interface ViewController ()
{
    NSMutableArray * filteredRes;
    BOOL isfind;
     NSMutableArray * toDoList;
     NSMutableArray * inProgressList;
     NSMutableArray * doneList;
    
    NSMutableArray * lowPList;
    NSMutableArray * medPList;
    NSMutableArray * highPList;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tasks = [NSMutableArray new];
    
    _tableView.delegate =self;
    _tableView.dataSource =self;
    isfind = false;
    self.searchBar.delegate = self;
    
    toDoList = [NSMutableArray new];
    inProgressList  = [NSMutableArray new];
    doneList= [NSMutableArray new];
    
    lowPList= [NSMutableArray new];
    medPList= [NSMutableArray new];
    highPList= [NSMutableArray new];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    _viewOption.selectedSegmentIndex = 0;
    if(searchText.length == 0)
    {
        isfind = false;
        
    }
    else
    {
        isfind = true;
        filteredRes = [[NSMutableArray alloc] init];
        for(Task * task in _tasks)
        {
            NSRange nameRange = [task.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredRes addObject:task];
            }
        }
        
    }
    [_tableView reloadData];
}
- (IBAction)toAddTaskScreen:(id)sender {
    AddTasksVC * addTaskVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AddTasksVC"];
    addTaskVC.refDelegate =self;
    //data
    
    [self.navigationController pushViewController:addTaskVC animated:YES];
}
-(void)didAddTask:(Task *)task
{
    [_tasks addObject:task];
    
    [_tableView reloadData];
}

- (IBAction)ChangeView:(id)sender {
     toDoList = [NSMutableArray new];
     inProgressList  = [NSMutableArray new];
     doneList= [NSMutableArray new];
     
     lowPList= [NSMutableArray new];
     medPList= [NSMutableArray new];
     highPList= [NSMutableArray new];
   
     if(_viewOption.selectedSegmentIndex == 1)
     {
         for(Task * task in _tasks)
         {
             if(task.status == 0)
             {
                 [toDoList addObject:task];
             }
         }
      }
      else if(_viewOption.selectedSegmentIndex == 2)
      {
          for(Task * task in _tasks)
          {
              if(task.status == 1)
              {
                  [inProgressList addObject:task];
              }
          }
      }
      else if(_viewOption.selectedSegmentIndex == 3)
      {
          for(Task * task in _tasks)
          {
              if(task.status == 2)
              {
                  [doneList addObject:task];
              }
          }
      }
                
      else if(_viewOption.selectedSegmentIndex == 4)
      {
          for(Task * task in _tasks)
          {
              if(task.priority == 0)
              {
                  [highPList addObject:task];
              }
          
              else if(task.priority == 1)
              {
                  [medPList addObject:task];
              }
          
              else if(task.priority == 2)
              {
                  [lowPList addObject:task];
              }
      }
      }
    
    [_tableView reloadData];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Task *task = [Task new];
    if(_viewOption.selectedSegmentIndex == 0)
        {
        if(isfind == false)
        {
            task = [_tasks objectAtIndex:indexPath.row];
        }
        else{
            task = [filteredRes objectAtIndex:indexPath.row];
            
        }
    }
    else if(_viewOption.selectedSegmentIndex == 1)
    {
        task = [toDoList objectAtIndex:indexPath.row];
    }
    else if(_viewOption.selectedSegmentIndex == 2)
    {
        task = [inProgressList objectAtIndex:indexPath.row];
    }
    else if(_viewOption.selectedSegmentIndex == 3)
    {
        task = [doneList objectAtIndex:indexPath.row];
    }
    else if(_viewOption.selectedSegmentIndex == 4)
    {
        if(indexPath.section == 0)
        {
            task = [lowPList objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 1)
        {
            task = [medPList objectAtIndex:indexPath.row];
        }
        else if(indexPath.section == 2)
        {
            task = [highPList objectAtIndex:indexPath.row];
        }
    }
    
    
    cell.textLabel.text = task.name;
    if(task.priority == 0)
    {
        cell.imageView.image = [UIImage imageNamed:@"high.png"];
    }
    else if(task.priority == 1)
    {
        cell.imageView.image = [UIImage imageNamed:@"medium.png"];
    }
    else if(task.priority == 2)
    {
        cell.imageView.image = [UIImage imageNamed:@"low.png"];
    }
    
    cell.detailTextLabel.text = @"";
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_viewOption.selectedSegmentIndex == 0)
    {
        if(isfind == true)
        {
            return filteredRes.count;
        }
        return _tasks.count;
    }
    else if(_viewOption.selectedSegmentIndex == 1)
    {
        return toDoList.count;
    }
    else if(_viewOption.selectedSegmentIndex == 2)
    {
        return inProgressList.count;
    }
    else if(_viewOption.selectedSegmentIndex == 3)
    {
        return doneList.count;
    }
    else if (_viewOption.selectedSegmentIndex == 4){
        switch(section){
            case 0:
                return lowPList.count;
                break;
            case 1:
                return medPList.count;
                break;
            case 2:
                return highPList.count;
                break;
        }
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_viewOption.selectedSegmentIndex == 4)
    {
        return 3;
    }
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if(section == 0 && lowPList.count != 0)
    {
        return @"Low";
    }
    else if(section == 1 && medPList.count != 0)
    {
        return @"Medium";
    }
    else if(section == 2 && highPList.count != 0){
        return @"High";
    }
    return @"";
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Task * task = _tasks[indexPath.row];
    DisplayTasksVC * displayTasksVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayTasksVC"];
    displayTasksVC.refObje = self;
    displayTasksVC.taskData = task;
    displayTasksVC.index = (int)indexPath.row;
    [self.navigationController pushViewController:displayTasksVC animated:YES];     
}

-(void)editObject:(int)index :(Task *)task
{
    _tasks[index] = task;
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Are you sure you want to delete" preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *Yes = [UIAlertAction actionWithTitle:@"Yes I'm Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.tasks removeObjectAtIndex:indexPath.row];
                         
                   
                   [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
        }];
        
        UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"No Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:Yes];
        [alert addAction:Cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}


@end

