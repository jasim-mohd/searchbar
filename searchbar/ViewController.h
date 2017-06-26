//
//  ViewController.h
//  searchbar
//
//  Created by user on 6/18/17.
//  Copyright © 2017 Mohamed Jasim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UISearchBar *mysearchBar;
@property (weak, nonatomic) IBOutlet UITableView *mytable;
@property (strong, nonatomic) NSMutableArray *initialCities;
@property (strong, nonatomic) NSMutableArray *filteredCities;
@property BOOL isfiltered;

@end

