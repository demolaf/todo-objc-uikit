//
//  Todo.h
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TodoPriority) {
    TodoPriorityLow,
    TodoPriorityNormal,
    TodoPriorityHigh
};

@interface Todo : NSObject

@property (nonatomic, readonly) NSUUID *uid;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *content;
@property (nonatomic, readonly) TodoPriority priority;
@property (nonatomic, readonly) NSDate *createdAt;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content priority:(TodoPriority)priority;

@end

NS_ASSUME_NONNULL_END
