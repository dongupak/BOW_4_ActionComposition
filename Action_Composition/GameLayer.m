//
//  GameLayer.m
//  Action_Composition
//
//  Created by ivis on 13. 6. 26..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	GameLayer *layer = [GameLayer node];
	[scene addChild: layer];
	return scene;
}

-(void)dealloc {
    [super dealloc];
}
-(id) init
{
	if( (self=[super init])) {
        CCSprite *back = [CCSprite spriteWithFile:@"back.png"];
        
        [back setPosition:ccp(240, 160)];
        [self addChild:back z:0];
        
        CCSprite *setting = [CCSprite spriteWithFile:@"setting.png"];
        [setting setPosition:ccp(240, 160)];
        [self addChild:setting z:1];
        
        CCSprite *pole = [CCSprite spriteWithFile:@"pole.png"];
        [pole setAnchorPoint:ccp(0.5f, 0.0f)];
        [pole setPosition:ccp(240, 0)];
        [self addChild:pole z:2];
        
        CCSprite *bird = [CCSprite spriteWithFile:@"blue_fly0001.png"];
        [bird setPosition:ccp(50, 160)];
        [self addChild:bird z:3];
        
        /*move 직선이동
         rotate 회전
         jump 점프
         scale 크기(배율)
         to(지정된 좌표로)<->by(현재 위치에서 입력한 좌표만큼)
         actionWithDuration 액션수행하는 시간(초)
         repeat time횟수만큼 반복
         repeatForever 무한 반복
         spawn 지정된 액션을 동시에 수행
         sequence 지정된 액션을 순차적으로 수행(RepeatForever는 수행불가)
         */
        
        
       // id actionMoveTo   = [CCMoveTo actionWithDuration:2 position:ccp(400, 160)];
        // 2초에 걸쳐 (400,160)으로 이동하는 id 타입의 actionMoveTo를 정의합니다.
        //id actionRotateBy = [CCRotateBy actionWithDuration:4.0 angle:720];
        // 4초에 걸쳐 현재 위치에서 시계방향으로 720도 회전하는 id 타입의 actionRotateBy를 정의합니다.
        //id actionSpawn    = [CCSpawn actions:actionMoveTo, actionRotateBy, nil];
        // 위에서 정의한 2개의 액션을 동시에 실행하는 id 타입의 actionSpawn을 정의합니다.
        //[bird runAction:actionSpawn];
        //bird 스프라이트가 actionSpawn을 실행하게 합니다.
        
        
        id actionMoveBy   = [CCMoveBy actionWithDuration:1 position:ccp(400, 0)];
        // 1초에 걸쳐 현재위치에서 (400,0)만큼 이동하는 id 타입의 actionMoveTo를 정의합니다.
        id actionReverse  = [actionMoveBy reverse];
        //actionMoveBy 액션을 반대로 취하는 id 타입의 액션 actionReverse를 정의합니다.
        
        id actionSequecne = [CCSequence actions:actionMoveBy, actionReverse, nil];
        //actionMoveBy 액션과 actionReverse 액션을 순차적으로 실행하는 id 타입의 액션 actionSequecne를 정의합니다.
        
        [bird runAction:actionSequecne];
        //bird 스프라이트가 actionSequecne를 실행하게 합니다.
        
        
       // id actionRepeat  = [CCRepeat actionWithAction:actionSequecne times:2];
        // 위의 시퀀스 액션을 2번 반복하는 id 타입의 액션 actionRepeat을 정의합니다.
        //[bird runAction:actionRepeat];
        //bird 스프라이트가 actionRepeat를 실행하게 합니다.

        id actionRepeat1  = [CCRepeatForever actionWithAction:actionSequecne];
        //위의 시퀀스 액션을 무한 반복하는 id 타입의 액션 actionRepeat1을 정의합니다.
        [bird runAction:actionRepeat1];
        //bird 스프라이트가 actionRepeat를 실행하게 합니다.
	}
	return self;
}

@end
