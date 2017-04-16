//
//  ViewController.m
//  RuntimeDemo
//
//  Created by wengzilin on 15/10/8.
//  Copyright (c) 2015年 wengzilin. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "WUserStatistics.h"

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UIButton *favBtn;
@property (strong, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"HomeViewController";
}

- (IBAction)onFavBtnPressed:(id)sender
{
    
}

- (IBAction)onShareBtnPressed:(id)sender
{
    
}

- (IBAction)onNextItemPressed:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *secondVC = [sb instantiateViewControllerWithIdentifier:NSStringFromClass([DetailViewController class])];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
