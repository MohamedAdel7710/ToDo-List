//
//  Task.h
//  TODOList
//
//  Created by Mohamed Adel on 1/4/22.
//  Copyright © 2022 Mohamed Adel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject


@property NSString * name ;
@property NSString * descTask;
@property int priority;
@property NSString *Date;
@property int status;


@end

NS_ASSUME_NONNULL_END
