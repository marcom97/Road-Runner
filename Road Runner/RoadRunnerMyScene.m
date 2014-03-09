//
//  RoadRunnerMyScene.m
//  Road Runner
//
//  Created by Marco Matamoros on 3/9/14.
//  Copyright (c) 2014 BlueStars Studios. All rights reserved.
//

#import "RoadRunnerMyScene.h"
#import "RoadRunnerGameScene.h"

@implementation RoadRunnerMyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        playLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        playLabel.text = @"Play";
        playLabel.fontSize = 30;
        playLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame));
        
        [self addChild:playLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([playLabel containsPoint:location])
        {
            SKScene *gameScene = [RoadRunnerGameScene sceneWithSize:self.size];
            [self.scene.view presentScene:gameScene];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end