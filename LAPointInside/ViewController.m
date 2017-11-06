//
//  ViewController.m
//  LAPointInside
//
//  Created by Lanmaq on 2017/11/6.
//  Copyright © 2017年 Lanmaq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LAPointInside.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    // Cover the event responsed area
    UIView *expandView = [[UIView alloc] init];
    expandView.backgroundColor = [UIColor whiteColor];
    expandView.userInteractionEnabled = NO;
    expandView.alpha = 0.5; // > 0.01
    [self.view addSubview:expandView];
    [self layoutView:expandView centerWithSize:CGSizeMake(200, 200)];
    
    
    // INView Test
    
    //    INView *inView = [[INView alloc] init];
    //    inView.backgroundColor= [UIColor yellowColor];
    //    inView.extInteractEdge = 50;
    //    inView.userInteractionEnabled = YES;
    //    [self.view addSubview:inView];
    //    [self layoutView:inView centerWithSize:CGSizeMake(100, 100)];
    //
    //    UITapGestureRecognizer *tapGestureRecongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClicks:)];
    //    [inView addGestureRecognizer:tapGestureRecongnizer];
    
    
    // UIView Category
    
    UIImageView *viewCategroy = [[UIImageView alloc] init];
    viewCategroy.backgroundColor= [UIColor yellowColor];
    viewCategroy.extInteractEdge = 50;
    viewCategroy.userInteractionEnabled = YES;
    [self.view addSubview:viewCategroy];
    [self layoutView:viewCategroy centerWithSize:CGSizeMake(100, 100)];
    
    UITapGestureRecognizer *tapGestureRecongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClicks:)];
    [viewCategroy addGestureRecognizer:tapGestureRecongnizer];
    
    
    // UIView Category
    
    //    UIButton *viewCategroy = [[UIButton alloc] init];
    //    [viewCategroy setBackgroundColor:[UIColor yellowColor]];
    //     viewCategroy.extInteractEdge = 50;
    //    [viewCategroy addTarget:self action:@selector(buttonClicks:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:viewCategroy];
    //    [self layoutView:viewCategroy centerWithSize:CGSizeMake(100, 100)];
}

- (void)buttonClicks:(id)sender {
    
    NSLog(@"%s", __func__);
    
    UIView *targetView = nil;
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *tapGesture  = (UITapGestureRecognizer *)sender;
        targetView  = tapGesture.view;
    }
    else if ([sender isKindOfClass:[UIView class]]) {
        targetView = (UIView *)sender;
    }
    
    [UIView animateWithDuration:0.25 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        targetView.transform = CGAffineTransformMakeScale(0.98, 0.98);
    } completion:^(BOOL finished) {
        targetView.transform = CGAffineTransformIdentity;
    }];
}

- (void)layoutView:(UIView *)targetView centerWithSize:(CGSize)viewSize {
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:targetView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:targetView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:targetView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:viewSize.width]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:targetView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:viewSize.height]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
