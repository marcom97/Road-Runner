//
//  RoadRunnerGameScene.m
//  Road Runner
//
//  Created by Marco Matamoros on 3/9/14.
//  Copyright (c) 2014 BlueStars Studios. All rights reserved.
//

#import "RoadRunnerGameScene.h"

@interface RoadRunnerGameScene ()

@property (nonatomic, strong) PBParallaxScrolling * parallaxBackground;

@end

@implementation RoadRunnerGameScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size])
    {
        
        NSArray * imageNames = @[@"Background@2x-ipad.tif"];
        PBParallaxScrolling * parallax = [[PBParallaxScrolling alloc] initWithBackgrounds:imageNames size:size direction:kPBParallaxBackgroundDirectionDown fastestSpeed:6 andSpeedDecrease:0];
        self.parallaxBackground = parallax;
        [self addChild:parallax];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches)
    {
        
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    [self.parallaxBackground update:currentTime];
}


@end
