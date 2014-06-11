//
//  GameScene.m
//  iOS8-Lighting
//
//  Created by ymc-thzi on 05.06.14.
//  Copyright (c) 2014 YMC. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    
    //Setup a background
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background.png" normalMapped:TRUE];
    background.size = self.size;
    background.zPosition = 0;
    background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    background.lightingBitMask = 1;
    [self addChild:background];
    
    
    //Setup some stone objects with different positions
    for (int i=1; i<4; i++) {
        SKSpriteNode *stone = [SKSpriteNode spriteNodeWithImageNamed:@"stone.png"];
        stone.position = CGPointMake(i*250, self.frame.size.height/2);
        [stone setScale:0.6];
        stone.zPosition = 1;
        stone.shadowCastBitMask = 1;
        [self addChild:stone];
    }
    
    
    //setup a fire emitter
    NSString *fireEmmitterPath = [[NSBundle mainBundle] pathForResource:@"fire" ofType:@"sks"];
    SKEmitterNode *fireEmmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:fireEmmitterPath];
    fireEmmitter.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 200);
    fireEmmitter.name = @"fireEmmitter";
    fireEmmitter.zPosition = 1;
    fireEmmitter.targetNode = self;
    [self addChild: fireEmmitter];
    
    
    //Setup a LightNode
    SKLightNode* light = [[SKLightNode alloc] init];
    light.categoryBitMask = 1;
    light.falloff = 1;
    light.ambientColor = [UIColor whiteColor];
    light.lightColor = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:0.0 alpha:0.5];
    light.shadowColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    [fireEmmitter addChild:light];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //On Dragging make the emitter with the attached light follow the position
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self childNodeWithName:@"fireEmmitter"].position = CGPointMake(location.x, location.y);
    }
}


@end
