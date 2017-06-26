//
//  WSScrollHeaderView.h
//  WSHeaderScrollAnimation
//
//  Created by WebsoftProfession on 6/9/17.
//  WebsoftProfession
//

#import <UIKit/UIKit.h>
@protocol WSScrollHeaderViewDelegate <NSObject>

@end

@interface WSScrollHeaderView : UIView<UIScrollViewDelegate>{
    IBOutlet id<WSScrollHeaderViewDelegate> delegate;
}

@property(nonatomic,strong) UIViewController *parentHolder;
@property (assign) CGFloat initialInset;
@property (assign) CGFloat scrollInset;
@property (assign) BOOL enableColorAnimation;
@property (assign) BOOL enableScaleAnimation;

@end
