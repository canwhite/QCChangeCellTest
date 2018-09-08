//
//  QCChangeCellCollectionViewCell.m
//  QCChangeCellDemo
//
//  Created by EricZhang on 2018/9/8.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "QCChangeCellCollectionViewCell.h"

@implementation QCChangeCellCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if( self ){
        [self initUI];
    }
    return self;
}


-(void)initUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    

        self.label = [UILabel new];
        [self addSubview:self.label];
        self.label.frame = CGRectZero;
        self.label.text = @"type==0：显示为当前label ； type==1： 显示为图片";
        self.label.font = [UIFont systemFontOfSize:13];
        self.label.textAlignment = NSTextAlignmentCenter;


        self.imageView = [UIImageView new];
        [self addSubview:self.imageView];
        self.imageView.frame = CGRectZero;
        [self.imageView setImage:[UIImage imageNamed:@"touxiang"]];

    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if(self.type == 0){

        self.label.frame = CGRectMake(0, 43.5, self.frame.size.width, 13);
        
    }else {

        self.imageView.frame = CGRectMake(self.frame.size.width/2-25, 25, 50, 50);
        
    }
    
    
}

-(void)setType:(NSInteger)type{
    
    _type = type;
    //当前runloop就刷新，两个一起用
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    
}


@end
