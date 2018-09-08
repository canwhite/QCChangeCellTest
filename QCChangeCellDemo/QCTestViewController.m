//
//  QCTestViewController.m
//  QCChangeCellDemo
//
//  Created by EricZhang on 2018/9/8.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "QCTestViewController.h"
#import "QCChangeCellCollectionViewCell.h"


@interface QCTestViewController ()< UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *collectionView;//
@property(nonatomic,strong) NSMutableArray *typeArr;
@end

@implementation QCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"测试";
    self.view.backgroundColor =RGBA(242, 242, 242, 1);
    self.typeArr = [NSMutableArray arrayWithObjects:@"0",@"1",@"0",@"0",@"1", nil];
    
    [self.view addSubview:self.collectionView];
    
    
}


-(UICollectionView *)collectionView{
    
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,10, CKScreenW, CKScreenH-10) collectionViewLayout:flowLayout];
        
        //定义每个UICollectionView zong向的间距
        flowLayout.minimumLineSpacing = 10;
        //定义每个UICollectionView heng向的间距
        flowLayout.minimumInteritemSpacing = 0;
        
        //注册cell
        NSArray *cellclassArr = @[[QCChangeCellCollectionViewCell class]];
        NSArray *reuseID = @[@"cell1"];
        
        for (int i = 0; i<reuseID.count; i++) {
            [_collectionView registerClass:cellclassArr[i] forCellWithReuseIdentifier:reuseID[i]];
        }
        
        //注册头部
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        
        //_collectionView.delaysContentTouches = NO;
        
        //背景颜色
        _collectionView.backgroundColor = RGBA(242, 242, 242, 1);
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        
        
    }
    return _collectionView;
    
}
#pragma mark - dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    return  self.typeArr.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    static NSString  *identify = @"cell1";
    QCChangeCellCollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell1.type = [self.typeArr[indexPath.row] integerValue];
    
    return cell1;
    
    
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return  UIEdgeInsetsMake(0,0,0,0);
    
}
//这个设置每个item的形状大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return  CGSizeMake(CKScreenW, 100);
    
}
#pragma mark -- collectioCell1的代理
-(void)CollectionViewCell1DelegateClickWithIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"......%ld",indexPath.row);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
