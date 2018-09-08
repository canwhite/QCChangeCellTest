//
//  QCChangeCellCollectionViewCell.h
//  QCChangeCellDemo
//
//  Created by EricZhang on 2018/9/8.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCChangeCellCollectionViewCell : UICollectionViewCell

@property(nonatomic,assign) NSInteger type;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UIImageView *imageView;

@end
