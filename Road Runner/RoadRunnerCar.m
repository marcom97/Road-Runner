//
//  RoadRunnerCar.m
//  Road Runner
//
//  Created by Marco Matamoros on 4/25/14.
//  Copyright (c) 2014 BlueStars Studios. All rights reserved.
//

#import "RoadRunnerCar.h"
#import "RoadRunnerGameScene.h"

@implementation RoadRunnerCar



- (id)init
{
    self = [super init];
    if (self)
    {
        NSString *color;
        int position = arc4random()%3;
        int chooseColor = arc4random()%4;
        switch (chooseColor) {
            case 0:
                color = @"Red";
                break;
            case 1:
                color = @"Blue";
                break;
            case 2:
                color = @"Yellow";
                break;
            case 3:
                color = @"Green";
                break;
            default:
                break;
                
        }
        
        switch (position)
        {
            case 0:
                position = [UIScreen mainScreen].bounds.size.width/6;
                break;
            case 1:
                position = [UIScreen mainScreen].bounds.size.width/2;
                break;
            case 2:
                position = [UIScreen mainScreen].bounds.size.width - [UIScreen mainScreen].bounds.size.width/6;
                break;
                
            default:
                break;
        }
        self = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"car%@.tif", color]];
        self.zPosition = 100;
        self.position = CGPointMake(position, [UIScreen mainScreen].bounds.size.height);
        
        SKAction *moveDown = [SKAction sequence:@[[SKAction moveToY:0 duration:2],[SKAction removeFromParent]]];
        [self runAction:moveDown];

    }
    return self;
}



@end
