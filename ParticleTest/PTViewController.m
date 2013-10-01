//
//  PTViewController.m
//  ParticleTest
//
//  Created by 遠藤 豪 on 13/10/01.
//  Copyright (c) 2013年 endo.tuyo. All rights reserved.
//

#import "PTViewController.h"
#import "PTOverlay.h"

@interface PTViewController ()

@end

@implementation PTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PTOverlay *particleView = [[PTOverlay alloc] initWithFrame: CGRectMake(0, 0, 320, 250)];
    [particleView setUserInteractionEnabled: NO];
    [self.view bringSubviewToFront: particleView];
    [self.view addSubview: particleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
