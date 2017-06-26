//
//  ViewController.m
//  WSScrollableHeader
//
//  Created by WebsoftProfession on 6/22/17.
//  WebsoftProfession
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imgView.layer.cornerRadius = imgView.frame.size.width/2;
    imgView.layer.borderColor  = [UIColor darkGrayColor].CGColor;
    imgView.layer.borderWidth = 1.0;
    
    wsImageHeader.enableScaleAnimation = YES;
    wsImageHeader.scrollInset = 0;
    
    wsSearchHeader.scrollInset = 125;
    wsSearchHeader.enableColorAnimation = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
