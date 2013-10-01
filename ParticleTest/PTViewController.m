//
//  PTViewController.m
//  ParticleTest
//
//  Created by 遠藤 豪 on 13/10/01.
//  Copyright (c) 2013年 endo.tuyo. All rights reserved.
//

#import "PTViewController.h"
#import "PTOverlay.h"

NSTimer *tm;
int y_background1, y_background2;
UIImageView *iv_background1, *iv_background2;
int counter;

@interface PTViewController ()

@end

@implementation PTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    y_background1 = 0;
    y_background2 = -400;
    counter = 0;
    
    
    tm = [NSTimer scheduledTimerWithTimeInterval:0.1
                                          target:self
                                        selector:@selector(time:)//タイマー呼び出し
                                        userInfo:nil
                                         repeats:YES];

    
}

-(void)drawBackground{
    
    //frameの大きさと背景の現在描画位置を決定
    //点数オブジェクトで描画
    //    NSLog(@"drawbackground : 1 = %d, 2 = %d", y_background1, y_background2);
    y_background1 += 5;
    y_background2 += 5;//スクロール速度
    CGRect rect_frame = [[UIScreen mainScreen] bounds];
    
    
    if(y_background1 > rect_frame.size.height){
        y_background1 = -rect_frame.size.height;
    }else if(y_background2 > rect_frame.size.height){
        y_background2 = -rect_frame.size.height;
    }
    
    
    [iv_background1 removeFromSuperview];
    [iv_background2 removeFromSuperview];
    iv_background1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, y_background1,rect_frame.size.width,rect_frame.size.height + 30)];
    iv_background2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, y_background2,rect_frame.size.width,rect_frame.size.height + 30)];
    //宇宙空間の描画方法
    iv_background1.image = [UIImage imageNamed:@"cosmos_star4.png"];
    iv_background2.image = [UIImage imageNamed:@"cosmos_star4.png"];
    iv_background1.alpha = 0.9;//透過率
    iv_background2.alpha = 0.5;//透過率
    
    
    
    [self.view addSubview:iv_background1];
    [self.view addSubview:iv_background2];
    
    [self.view sendSubviewToBack:iv_background1];//最背面に表示
    [self.view sendSubviewToBack:iv_background2];
    
    //    x_frame = rect_frame.size.width;
    //    y_frame = rect_frame.size.height;
}

- (void)time:(NSTimer*)timer{
    [self drawBackground];
    
    NSLog(@"counter = %d", counter++);
    
    
    if(counter == 20){
        PTOverlay *particleView = [[PTOverlay alloc] initWithFrame: CGRectMake(0, 0, 320, 250)];
        [particleView setUserInteractionEnabled: NO];
        [self.view bringSubviewToFront: particleView];
        [self.view addSubview: particleView];
    }
}
@end
