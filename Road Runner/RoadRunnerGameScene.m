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
        float speed = 0.005;
        background = [SKSpriteNode spriteNodeWithImageNamed:@"Background"];
        backgroundCopy = [background copy];
        
        if (size.height == 960)
        {
            [background setAnchorPoint:CGPointZero];
            background.position = CGPointZero;
            [backgroundCopy setAnchorPoint:CGPointZero];
            backgroundCopy.position = CGPointZero;
        }
        else
        {
            background.position = CGPointMake(self.size.width/2, self.size.height/2);
            backgroundCopy.position = CGPointMake(self.size.width/2, self.size.height*1.5);
        }

        
        SKAction *backgroundMove = [SKAction repeatActionForever:[SKAction moveBy:CGVectorMake(0, -1) duration:speed]];
        [background runAction:backgroundMove];
        [backgroundCopy runAction:backgroundMove];
        [self addChild:background];
        [self addChild:backgroundCopy];
        
        NSArray * imageNames = [NSArray arrayWithObject:@"Background"];
        PBParallaxScrolling * parallax = [[PBParallaxScrolling alloc] initWithBackgrounds:imageNames size:size direction:kPBParallaxBackgroundDirectionDown fastestSpeed:6 andSpeedDecrease:0];
        self.parallaxBackground = parallax;
        //[self addChild:parallax];
        
        RoadRunnerCar *car = [[RoadRunnerCar alloc] init];
        [self addChild: car];
        
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
    [self scrollingBackground];
}

- (void)scrollingBackground
{
    if (self.size.height == 480)
    {
        if (background.position.y < -background.size.height/2)
        {
            background.position = CGPointMake(self.size.width/2, backgroundCopy.position.y + background.size.height);
        }
        
        if (backgroundCopy.position.y < -background.size.height/2)
        {
            backgroundCopy.position = CGPointMake(self.size.width/2, background.position.y + background.size.height);
        }
    }
    
    else
    {
        if (background.position.y < -self.size.height/2)
        {
            background.position = CGPointMake(self.size.width/2, backgroundCopy.position.y + self.size.height);
        }
    
        if (backgroundCopy.position.y < -self.size.height/2)
        {
            backgroundCopy.position = CGPointMake(self.size.width/2, background.position.y + self.size.height);
        }
    }
}


@end
