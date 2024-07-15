//
//  ViewController.m
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import "HomeViewController.h"
#import "TodoListItemTableViewCell.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readwrite) UIView *rootView;
@property (nonatomic, readwrite) UITableView *todoListTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeSubviews];
    [self initializeViewAppearance];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self applyConstraints];
}

- (void)initializeSubviews {
    [self setupRootView];
    [self setupTodoListTableView];
}

- (void)setupRootView {
    _rootView = [[UIView alloc] init];
    _rootView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_rootView];
}

- (void)setupTodoListTableView {
    _todoListTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _todoListTableView.delegate = self;
    _todoListTableView.dataSource = self;
    _todoListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_todoListTableView registerClass:[TodoListItemTableViewCell class] forCellReuseIdentifier:kTodoListItemReuseId];
    _todoListTableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.rootView addSubview:_todoListTableView];
}

- (void)applyConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [_rootView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [_rootView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16],
        [_rootView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-16],
        [_rootView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [_todoListTableView.topAnchor constraintEqualToAnchor:_rootView.topAnchor],
        [_todoListTableView.leadingAnchor constraintEqualToAnchor:_rootView.leadingAnchor],
        [_todoListTableView.trailingAnchor constraintEqualToAnchor:_rootView.trailingAnchor],
        [_todoListTableView.bottomAnchor constraintEqualToAnchor:_rootView.bottomAnchor]
    ]];
}

- (void)initializeViewAppearance {
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    self.title = @"Home";
    self.navigationController.navigationBar.prefersLargeTitles = true;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoListItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTodoListItemReuseId forIndexPath:indexPath];
    [cell configureWithTodo:[[Todo alloc] initWithTitle:@"Buy Milk" content:@"Lorem Ipsum and a couple of BS" priority:TodoPriorityLow]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row %ld selected", (long)indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
