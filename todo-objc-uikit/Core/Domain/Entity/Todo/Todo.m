//
//  Todo.m
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import "Todo.h"

@interface Todo()

@property (nonatomic, readwrite) NSUUID *uid;
@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *content;
@property (nonatomic, readwrite) TodoPriority priority;
@property (nonatomic, readwrite) NSDate *createdAt;

@end

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content priority:(TodoPriority)priority {
    self = [super init];

    if (self) {
        _uid = [[NSUUID alloc] init];
        _title = title;
        _content = content;
        _priority = priority;
        _createdAt = [[NSDate alloc] init];
    }

    return self;
}

@end
