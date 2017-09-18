//
//  NIMSessionNetChatNotifyContentView.m
//  NIMKit
//
//  Created by chris on 15/5/8.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NIMSessionNetChatNotifyContentView.h"
#import "M80AttributedLabel+NIMKit.h"
#import "NIMMessageModel.h"
#import "NIMKitUtil.h"
#import "NIMKitUIConfig.h"
#import "UIView+NIM.h"

@implementation NIMSessionNetChatNotifyContentView

-(instancetype)initSessionMessageContentView
{
    if (self = [super initSessionMessageContentView]) {
        _textLabel = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textLabel.numberOfLines = 0;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_textLabel];
    }
    return self;
}

- (void)refresh:(NIMMessageModel *)data
{
    [super refresh:data];
    NSString *text = [NIMKitUtil messageTipContent:data.message];
    [self.textLabel nim_setText:text];
    
    NIMKitBubbleConfig *config = [[NIMKitUIConfig sharedConfig] bubbleConfig:data.message];
    
    self.textLabel.textColor = config.contentTextColor;;
    self.textLabel.font      = config.contentTextFont;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    CGFloat tableViewWidth = self.superview.nim_width;
    CGSize contentsize = [self.model contentSize:tableViewWidth];
    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    self.textLabel.frame = labelFrame;
}


@end
