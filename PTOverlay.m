//
//  PTOverlay.m
//  ParticleTest
//
//  Created by 遠藤 豪 on 13/10/01.
//  Copyright (c) 2013年 endo.tuyo. All rights reserved.
//

#import "PTOverlay.h"

@implementation PTOverlay

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        particleEmitter = (CAEmitterLayer *) self.layer;
        particleEmitter.emitterPosition = CGPointMake(frame.origin.x, frame.origin.y);//CGPointMake(0, 0);
        particleEmitter.emitterSize = CGSizeMake(10, 10);
        particleEmitter.renderMode = kCAEmitterLayerAdditive;
        
        CAEmitterCell *particle = [CAEmitterCell emitterCell];
        particle.birthRate = 200;
        particle.lifetime = 2.0;
        particle.lifetimeRange = 1.5;
        particle.color = [[UIColor colorWithRed: 0.2 green: 0.4 blue: 0.8 alpha: 0.1] CGColor];
        particle.contents = (id) [[UIImage imageNamed: @"Particles_fire.png"] CGImage];
        particle.name = @"particle";
        particle.velocity = 150;
        particle.velocityRange = 100;
        particle.emissionRange = M_PI_2;
        particle.emissionLongitude = 0.025 * 180 / M_PI;
        particle.scaleSpeed = 0;
        particle.spin = 0.5;
        
        particleEmitter.emitterCells = [NSArray arrayWithObject: particle];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (Class)layerClass
{
    return [CAEmitterLayer class];
}


@end
