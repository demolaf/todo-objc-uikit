//
//  TodoListItemTableViewCell.h
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "NSDate+NSString.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *kTodoListItemReuseId = @"TodoListItemTableViewCell";

@interface TodoListItemTableViewCell : UITableViewCell

- (void)configureWithTodo:(Todo *)todo;

@end

NS_ASSUME_NONNULL_END
