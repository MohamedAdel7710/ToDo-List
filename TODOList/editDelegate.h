//
//  editDelegate.h
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import "Task.h"
@protocol editDelegate <NSObject>

-(void)editObject:(int)index :(Task *)task;

@end
