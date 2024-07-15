//
//  TodoListItemTableViewCell.m
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import "TodoListItemTableViewCell.h"

@interface TodoListItemTableViewCell()

@property (nonatomic, readwrite) UIView *rootView;
@property (nonatomic, readwrite) UIStackView *rootHStack;
@property (nonatomic, readwrite) UIStackView *textsVStack;
@property (nonatomic, readwrite) UIImageView *icon;
@property (nonatomic, readwrite) UILabel *titleLabel;
@property (nonatomic, readwrite) UILabel *contentLabel;
@property (nonatomic, readwrite) UILabel *timeLabel;

@end

@implementation TodoListItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self initializeSubviews];
    }

    return self;
}

// -(instancetype)initWithTodo:(Todo *)todo {
//     self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTodoListItemReuseId];
//
//     if (self) {
//         [self initializeSubviews];
//     }
//
//     return self;
// }

- (void)initializeSubviews {
    [self setupRootView];
    [self setupRootHStack];
    [self setupTextsVStack];
    [self setupTitleLabel];
    [self setupContentLabel];
    [self setupTimeLabel];
}

- (void)setupRootView {
    _rootView = [[UIView alloc] init];
    _rootView.layer.cornerRadius = 16;
    _rootView.layer.masksToBounds = true;
    _rootView.backgroundColor = UIColor.systemGrayColor;
    _rootView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:_rootView];
}

- (void)setupRootHStack {
    _rootHStack = [[UIStackView alloc] init];
    _rootHStack.axis = UILayoutConstraintAxisHorizontal;
    _rootHStack.distribution = UIStackViewDistributionFill;
    _rootHStack.translatesAutoresizingMaskIntoConstraints = false;
    [_rootView addSubview:_rootHStack];
}

- (void)setupTextsVStack {
    _textsVStack = [[UIStackView alloc] init];
    _textsVStack.axis = UILayoutConstraintAxisVertical;
    _textsVStack.distribution = UIStackViewDistributionFill;
    _textsVStack.alignment = UIStackViewAlignmentFill;
    _textsVStack.translatesAutoresizingMaskIntoConstraints = false;
    [_rootHStack addArrangedSubview:_textsVStack];
}

- (void)setupIcon {
    _icon = [[UIImageView alloc] init];
    [_rootHStack addArrangedSubview:_icon];
}

- (void)setupTitleLabel {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"Title";
    [_textsVStack addArrangedSubview:_titleLabel];
}

- (void)setupContentLabel {
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.text = @"Content";
    [_textsVStack addArrangedSubview:_contentLabel];
}

- (void)setupTimeLabel {
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = @"Time";
    [_rootHStack addArrangedSubview:_timeLabel];
}

-(void)prepareForReuse {
    [super prepareForReuse];
    _icon.image = nil;
    _titleLabel.text = nil;
    _contentLabel.text = nil;
    _timeLabel.text = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self applyConstraints];
}

- (void)applyConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [_rootView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [_rootView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_rootView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [_rootView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16]
    ]];

    [NSLayoutConstraint activateConstraints:@[
        [_rootHStack.topAnchor constraintEqualToAnchor:_rootView.topAnchor constant:16],
        [_rootHStack.leadingAnchor constraintEqualToAnchor:_rootView.leadingAnchor constant:16],
        [_rootHStack.trailingAnchor constraintEqualToAnchor:_rootView.trailingAnchor constant:-16],
        [_rootHStack.bottomAnchor constraintEqualToAnchor:_rootView.bottomAnchor constant:-16]
    ]];

    // [NSLayoutConstraint activateConstraints:@[
    //     [_icon.widthAnchor constraintEqualToConstant:24],
    // ]];
}

- (void)configureWithTodo:(Todo *)todo {
    _icon = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"exclamationmark.triangle.fill"]];
    _titleLabel.text = todo.title;
    _contentLabel.text = todo.content;
    _timeLabel.text = todo.createdAt.formattedDate;
}

@end
