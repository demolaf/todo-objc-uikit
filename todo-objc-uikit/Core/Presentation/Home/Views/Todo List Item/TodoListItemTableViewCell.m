//
//  TodoListItemTableViewCell.m
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import "TodoListItemTableViewCell.h"
#import <CoreGraphics/CoreGraphics.h>

@interface TodoListItemTableViewCell()

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

- (void)initializeSubviews {
    [self setupContentView];
    [self setupRootHStack];
    [self setupIcon];
    [self setupTextsVStack];
    [self setupTitleLabel];
    [self setupContentLabel];
    [self setupTimeLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self applyConstraints];
}

- (void)applyConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [_rootHStack.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16],
        [_rootHStack.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [_rootHStack.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16],
        [_rootHStack.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16],
    ]];

    self.contentView.frame = UIEdgeInsetsInsetRect(self.contentView.frame, UIEdgeInsetsMake(8, 12, 8, 12));
}

-(void)prepareForReuse {
    [super prepareForReuse];
    _icon.image = nil;
    _titleLabel.text = nil;
    _contentLabel.text = nil;
    _timeLabel.text = nil;
}

- (void)setupContentView {
    self.contentView.backgroundColor = UIColor.systemBackgroundColor;

    // border
    self.contentView.layer.cornerRadius = 16;
    self.contentView.layer.borderColor = UIColor.tertiarySystemFillColor.CGColor;
    self.contentView.layer.borderWidth = 0.5;

    // shadow
    self.contentView.layer.geometryFlipped = false;
    self.contentView.layer.shadowColor = UIColor.systemGrayColor.CGColor;
    self.contentView.layer.shadowRadius = 5;
    self.contentView.layer.shadowOpacity = 0.3;
    self.contentView.layer.shadowOffset = CGSizeMake(2, 4);
}

- (void)setupRootHStack {
    _rootHStack = [[UIStackView alloc] init];
    _rootHStack.spacing = 8;
    _rootHStack.axis = UILayoutConstraintAxisHorizontal;
    _rootHStack.distribution = UIStackViewDistributionFill;
    _rootHStack.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:_rootHStack];
}

- (void)setupTextsVStack {
    _textsVStack = [[UIStackView alloc] init];
    _textsVStack.spacing = 8;
    _textsVStack.axis = UILayoutConstraintAxisVertical;
    _textsVStack.distribution = UIStackViewDistributionFill;
    _textsVStack.alignment = UIStackViewAlignmentLeading;
    _textsVStack.translatesAutoresizingMaskIntoConstraints = false;
    [_rootHStack addArrangedSubview:_textsVStack];
}

- (void)setupIcon {
    _icon = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"exclamationmark.triangle.fill"]];
    _icon.contentMode = UIViewContentModeScaleAspectFit;
    _icon.tintColor = UIColor.systemGrayColor;
    [NSLayoutConstraint activateConstraints:@[
        [_icon.widthAnchor constraintEqualToConstant:36],
    ]];
    _icon.translatesAutoresizingMaskIntoConstraints = false;
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
    _contentLabel.numberOfLines = 2;
    [_textsVStack addArrangedSubview:_contentLabel];
}

- (void)setupTimeLabel {
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = @"Time";
    [_rootHStack addArrangedSubview:_timeLabel];
}

- (void)configureWithTodo:(Todo *)todo {
    _icon.image = [UIImage systemImageNamed:@"exclamationmark.triangle.fill"];
    _titleLabel.text = todo.title;
    _contentLabel.text = todo.content;
    _timeLabel.text = todo.createdAt.formattedDate;
}

@end
