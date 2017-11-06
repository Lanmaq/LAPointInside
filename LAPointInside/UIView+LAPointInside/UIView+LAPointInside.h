//
//  UIView+LAPointInside.h
//  LAPointInside
//
//  Created by Lanmaq on 2017/11/6.
//  Copyright © 2017年 Lanmaq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LAPointInside)

@property (nonatomic, assign) NSInteger extInteractEdge; // default is 0
@property (nonatomic, assign) UIEdgeInsets extInteractInsets; // receive event area, default is UIEdgeInsets(extInteractEdge, extInteractEdge, extInteractEdge, extInteractEdge)

@end
