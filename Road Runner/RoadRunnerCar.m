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

static const uint32_t playerCategory = 0x1 << 1;
static const uint32_t carCategory = 0x1 << 2;

- (id)init
{
    self = [super init];
    if (self)
    {
        

    }
    return self;
}

-(id)car
{
    NSString *color;
    int position = arc4random()%3;
    int chooseColor = arc4random()%4;
    int speed;
    int chooseType = arc4random()%3;
    NSString *type;
    
    switch (chooseType) {
        case 0:
            type = @"car";
            break;
        case 1:
            type = @"fastCar";
            break;
        case 2:
            type = @"bus";
            
        default:
            break;
    }
    
    
    
    if ([type  isEqual: @"fastCar"])
    {
        speed = 1;
    }
    else
    {
        speed = 2;
    }
    
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
    SKSpriteNode *car = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"%@%@@2x.png", type, color]];
    car.zPosition = 100;
    car.position = CGPointMake(position, [UIScreen mainScreen].bounds.size.height);
    car.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:car.size];
    car.physicsBody.categoryBitMask = carCategory;
    car.physicsBody.contactTestBitMask = playerCategory;
    car.physicsBody.collisionBitMask = playerCategory;
    
    SKAction *moveDown = [SKAction sequence:@[[SKAction moveToY:0 duration:2],[SKAction removeFromParent]]];
    [car runAction:moveDown];
    return car;
}



@end
