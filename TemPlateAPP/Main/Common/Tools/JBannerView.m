//
//  JBannerView.m
//  TemPlateAPP
//
//  Created by lorne on 2019/3/15.
//  Copyright © 2019 ice. All rights reserved.
//

#import "JBannerView.h"


@interface BannerFlowLayout : UICollectionViewFlowLayout
@end

@implementation BannerFlowLayout
- (void)prepareLayout{
    [super prepareLayout];
    self.itemSize = self.collectionView.bounds.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;//横向滑动
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
}
@end


@interface BannerCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BannerCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}
- (void)setupUI{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    self.imageView.backgroundColor = RANDOM_COLOR;
}

@end



#define BannerCellID @"BannerCellID"

@interface JBannerView()<UICollectionViewDelegate , UICollectionViewDataSource>
@property (nonatomic , strong)UICollectionView* collectionView;
@property (nonatomic , strong)UIPageControl* pageControl;
@property (nonatomic , strong)NSTimer* timer;
@end

@implementation JBannerView
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setupCollectionView];
        [self setupPageControlView];
        [self setupTimer];
    }
    return self;
}
- (void)setupCollectionView{
    BannerFlowLayout* flowLayout = [[BannerFlowLayout alloc] init];
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.bounces = YES;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[BannerCell class] forCellWithReuseIdentifier:BannerCellID];
    [self addSubview:collectionView];
    self.collectionView = collectionView;
}

- (void)setupPageControlView{
    UIPageControl* pageControl = [[UIPageControl alloc] init];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)setupTimer{
    NSTimer* timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
    
}


- (void)nextPage{
    
    
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
