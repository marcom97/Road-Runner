//
//  RoadRunnerGameScene.h
//  Road Runner
//
//  Created by Marco Matamoros on 3/9/14.
//  Copyright (c) 2014 BlueStars Studios. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RoadRunnerCar.h"

@interface RoadRunnerGameScene : SKScene <SKPhysicsContactDelegate>
{
    SKSpriteNode *background;
    SKSpriteNode *backgroundCopy;
    SKSpriteNode *player;
    RoadRunnerCar *car;
    int count;
    BOOL start;
    CGPoint location1;
    int currentPosition;

}


@end
