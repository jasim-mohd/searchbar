//
//  imageViewController.m
//  searchbar
//
//  Created by user on 6/25/17.
//  Copyright © 2017 Mohamed Jasim. All rights reserved.
//

#import "imageViewController.h"

@interface imageViewController ()

@end

@implementation imageViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    UIImageView *imgview = [[UIImageView alloc]
                            initWithFrame:CGRectMake(10, 10, 300, 400)];
    [imgview setImage:[UIImage imageNamed:@"image.jpg"]];
    [imgview setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imgview];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
