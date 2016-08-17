//
//  CoreView.m
//  CoreAnimation实现倒影效果
//
//  Created by 王玉翠 on 16/8/17.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import "CoreView.h"

@implementation CoreView


+(Class)layerClass{
    
    return [CAReplicatorLayer class];
    
    
}

-(void)setup{
    [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"屏幕快照 2016-08-17 下午12.00.42"]]];
    CAReplicatorLayer *repl = (CAReplicatorLayer *)self.layer;
    repl.instanceCount  = 2;
    repl.instanceTransform = CATransform3DMakeRotation(M_PI, 1,0, 0);
    
    //倒影效果
    repl.instanceRedOffset -= 0.2;
    repl.instanceBlueOffset -= 0.2;
    repl.instanceGreenOffset -= 0.2;
    repl.instanceAlphaOffset -= 0.2;
    
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
    
    
}




@end
