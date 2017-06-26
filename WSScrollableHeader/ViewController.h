//
//  ViewController.h
//  WSScrollableHeader
//
//  Created by WebsoftProfession on 6/22/17.
//  WebsoftProfession
//

#import <UIKit/UIKit.h>
#import "WSScrollHeaderView.h"

@interface ViewController : UIViewController
{
    __weak IBOutlet WSScrollHeaderView *wsImageHeader;
    __weak IBOutlet WSScrollHeaderView *wsNameHeader;
    __weak IBOutlet WSScrollHeaderView *wsSearchHeader;
    __weak IBOutlet UIImageView *imgView;
    
}

@end

