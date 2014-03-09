//
//  RoadRunnerViewController.m
//  Road Runner
//
//  Created by Marco Matamoros on 3/9/14.
//  Copyright (c) 2014 BlueStars Studios. All rights reserved.
//

#import "RoadRunnerViewController.h"
#import "RoadRunnerMyScene.h"

@implementation RoadRunnerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    SKView *skView = (SKView *)self.view;
    
    // Create and configure the scene.
    SKScene * menuScene = [RoadRunnerMyScene sceneWithSize:skView.bounds.size];
    menuScene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:menuScene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end