//
//  RoadRunnerGameScene.m
//  Road Runner
//
//  Created by Marco Matamoros on 3/9/14.
//  Copyright (c) 2014 BlueStars Studios. All rights reserved.
//

#import "RoadRunnerGameScene.h"

@interface RoadRunnerGameScene ()


@end

@implementation RoadRunnerGameScene

static const uint32_t playerCategory = 0x1 << 1;
static const uint32_t carCategory = 0x1 << 2;


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size])
    {
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
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
        
        [self addPlayer];
        
        car = [[RoadRunnerCar alloc] init];
        
        start = false;
        
        currentPosition = 2;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    for (UITouch *touch in touches)
    {
        location1 = [touch locationInNode:self];
        start = true;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location2 = [touch locationInNode:self];
        
        //Setting current position
        if (location1.x > location2.x)
        {
            if (currentPosition != 1)
            {
                currentPosition = currentPosition - 1;
            }
        }
        
        else if (location1.x < location2.x)
        {
            if (currentPosition != 3)
            {
                currentPosition = currentPosition + 1;
            }
        }
        
        //Setting the current position to player
        switch (currentPosition)
        {
            case 1:
                player.position = CGPointMake(self.size.width/6, player.position.y);
                break;
                
            case 2:
                player.position = CGPointMake(self.size.width/2, player.position.y);
                break;
                
                case 3:
                player.position = CGPointMake(self.size.width - self.size.width/6, player.position.y);
                
            default:
                break;
        }
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    [self scrollingBackground];
    if (start == true)
    {
    [self sendCar];
    }
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

-(void)sendCar
{
    count++;
    if (count == 60)
    {
        count = 0;
    int send = arc4random()%2;
    if (send == 0)
    {
        SKSpriteNode *carSprite = [car car];
        [self addChild: carSprite];
    }
    }
    
}

-(void)addPlayer
{
    player = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:0.05 green:0.00 blue:1.00 alpha:1.0] size:CGSizeMake(self.size.width/4, self.size.width/4)];
    player.position = CGPointMake(self.size.width/2, player.size.height/2);
    player.zPosition = 99;
    
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.categoryBitMask = playerCategory;
    player.physicsBody.contactTestBitMask = carCategory;
    player.physicsBody.collisionBitMask = carCategory;
    
    [self addChild: player];
}

-(void)didBeginContact:(SKPhysicsContact*)contact
{
    SKPhysicsBody *firstBody, *secondBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else{
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    NSLog(@"first body %@",firstBody);
    NSLog(@"second %@",secondBody);
    
    if ((firstBody.categoryBitMask & playerCategory) != 0 &&
        (secondBody.categoryBitMask & carCategory) != 0)
    {
        NSLog(@"CORRECT CONTACT!");
        SKLabelNode *lost = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
        lost.text = @"You Lost";
        [self addChild: lost];
    }
}


@end
