//
//  DITProgressView.m
//  DiTing
//
//  Created by ZHUYN on 2018/5/23.
//  Copyright © 2018年 zyn. All rights reserved.
//

#define DITCircleLineWidth 10.0f
#define DITCircleColor [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1]

#import "DITProgressView.h"

@implementation DITProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setProgress:(NSInteger)progress
{
    _progress = progress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (self.progressType == DITProgressLine)
    {
        
    }
    else if (self.progressType == DITProgressCircle)
    {
        //路径
        UIBezierPath *path = [[UIBezierPath alloc] init];
        //线宽
        path.lineWidth = DITCircleLineWidth;
        //颜色
        [DITCircleColor set];
        //拐角
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineJoinRound;
        //半径
        CGFloat radius = (MIN(rect.size.width, rect.size.height) - DITCircleLineWidth) * 0.5;
        //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
        [path addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2 * _progress clockwise:YES];
        //连线
        [path stroke];
    }
    else if (self.progressType == DITProgressWave)
    {
        
    }
    else if (self.progressType == DITProgressInstall)
    {
        
    }
        
}

@end
