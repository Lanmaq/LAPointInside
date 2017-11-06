//
//  UIView+LAPointInside.m
//  LAPointInside
//
//  Created by Lanmaq on 2017/11/6.
//  Copyright © 2017年 Lanmaq. All rights reserved.
//

#import "UIView+LAPointInside.h"
#import <objc/runtime.h>

static char extInteractEdgeKey;
static char extInteractInsetsKey;

@implementation UIView (LAPointInside)

static inline CGRect HitTestingRect (CGRect viewRect, UIEdgeInsets edgeInsets) {
    
    return CGRectMake(viewRect.origin.x - edgeInsets.left, viewRect.origin.y - edgeInsets.top, viewRect.size.width + edgeInsets.left + edgeInsets.right, viewRect.size.height + edgeInsets.top + edgeInsets.bottom);
}

- (void)setExtInteractEdge:(NSInteger)extInteractEdge {
    
    objc_setAssociatedObject(self, &extInteractEdgeKey, @(extInteractEdge),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // set extInteractInsets
    self.extInteractInsets = UIEdgeInsetsMake(extInteractEdge, extInteractEdge, extInteractEdge, extInteractEdge);
}

- (NSInteger)extInteractEdge {
    
    return [objc_getAssociatedObject(self, &extInteractEdgeKey) integerValue];
}

- (void)setExtInteractInsets:(UIEdgeInsets)extInteractInsets {
    
    objc_setAssociatedObject(self, &extInteractInsetsKey, [NSValue valueWithUIEdgeInsets:extInteractInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)extInteractInsets {
    
    return [objc_getAssociatedObject(self, &extInteractInsetsKey) UIEdgeInsetsValue];
}

// Returns a Boolean value indicating whether the receiver contains the specified point.
// YES if point is inside the receiver’s bounds; otherwise, NO.
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (CGRectContainsPoint(HitTestingRect(self.bounds, self.extInteractInsets), point)) {
        return YES;
    }
    return NO;
}

@end
