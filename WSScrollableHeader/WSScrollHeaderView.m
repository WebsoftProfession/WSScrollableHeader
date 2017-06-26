//
//  WSScrollHeaderView.m
//  WSHeaderScrollAnimation
//
//  Created by WebsoftProfession on 6/9/17.
//  WebsoftProfession
//

#import "WSScrollHeaderView.h"



@implementation WSScrollHeaderView

{
    UIScrollView *scrollVC;
    UIViewController *controller;
    
}


@synthesize scrollInset;


- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (UIView *view in self.superview.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            WSScrollHeaderView *delegateHolder =[WSScrollHeaderView sharedInstance];
            scrollVC = (UIScrollView *)view;
            scrollVC.delegate = delegateHolder;
            controller = (UIViewController *)delegate;
            delegateHolder.parentHolder = controller;
            self.initialInset = self.frame.origin.y;
            break;
        }
    }
}

+(instancetype)sharedInstance{
    static WSScrollHeaderView *sharedClient =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[WSScrollHeaderView alloc] init];
    });
    return sharedClient;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    for (WSScrollHeaderView *view in scrollView.superview.subviews) {
        if ([view isKindOfClass:[WSScrollHeaderView class]]) {
            
            CGFloat scrollValue = view.initialInset - scrollView.contentOffset.y;
            if (scrollValue>=view.scrollInset && scrollValue<view.initialInset) {
            }
            if (scrollView.contentOffset.y<=0) {
                scrollValue = view.initialInset;
                scrollValue = view.initialInset + (-1)*(scrollView.contentOffset.y);
                //scroll down
            }
            else{
                if (scrollView.contentOffset.y>=(view.initialInset-view.scrollInset)) {
                    scrollValue = view.scrollInset;
                    // scroll up
                }
            }
            view.frame = CGRectMake(view.frame.origin.x, scrollValue, view.frame.size.width, view.frame.size.height);
            if (view.enableColorAnimation) {
                [self runColorAnimationOnView:view withScrollValue:scrollValue];
            }
            if (view.enableScaleAnimation) {
                [self runScaleAnimationOnView:view withScrollValue:scrollValue];
            }
        }
    }
}


-(void)runColorAnimationOnView:(WSScrollHeaderView *)view withScrollValue:(CGFloat)value {
    
    CGFloat alphaRatio = 1-(value/view.initialInset);
    const CGFloat *colors = CGColorGetComponents( view.backgroundColor.CGColor );
    CGFloat red = colors[0];
    CGFloat green = colors[1];
    CGFloat blue = colors[2];
    view.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alphaRatio].CGColor;
}

-(void)runScaleAnimationOnView:(WSScrollHeaderView *)view withScrollValue:(CGFloat)value {
    
    CGFloat scaleRatio = 0.2-((value/view.initialInset)/5);
    for (UIView *scaleView in view.subviews) {
        scaleView.layer.transform = CATransform3DMakeScale(1-scaleRatio,1-scaleRatio, 1.0);
    }
    
}



@end
