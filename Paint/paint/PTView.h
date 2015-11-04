//
//  PTView.h
//  paint
//
//  Created by Dong Li on 10/26/15.
//  Copyright © 2015 Dong Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTView : UIView

@property(nonatomic,strong)NSMutableArray *paths; //use to store pathes(points)
-(void)clear;
-(void)undo;

@end