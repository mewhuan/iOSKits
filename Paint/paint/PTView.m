//
//  PTView.m
//  paint
//
//  Created by Dong Li on 10/26/15.
//  Copyright © 2015 Dong Li. All rights reserved.
//

#import "PTView.h"

@implementation PTView

-(NSMutableArray*)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint start = [touch locationInView:touch.view];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    [self.paths addObject:path];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint move = [touch locationInView:touch.view];
    UIBezierPath *lastPath = [self.paths lastObject];
    [lastPath addLineToPoint:move];
    [self setNeedsDisplay]; //setNeedsDisplay calls drawRect automatically
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint end = [touch locationInView:touch.view];
    UIBezierPath *path = [self.paths lastObject];
    [path addLineToPoint:end];
    [self setNeedsDisplay];
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch canceled");
}
-(void) drawRect:(CGRect)rect
{
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}
-(void)clear
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}
-(void)undo
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

@end
