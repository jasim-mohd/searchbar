//
//  ViewController.m
//  searchbar
//
//  Created by user on 6/18/17.
//  Copyright © 2017 Mohamed Jasim. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController
//@synthesize
- (void)viewDidLoad {
    [super viewDidLoad];
    _initialCities = [[NSMutableArray alloc]initWithObjects:@"Dubai", @"Sharjah", @"Abu Dhabi", nil];
}

#pragma mark - TableView data source
#pragma mark

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isfiltered == YES)
        return _filteredCities.count;
    else
        return _initialCities.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    if (_isfiltered == YES)
        cell.textLabel.text = [_filteredCities objectAtIndex:indexPath.row];
    else
        cell.textLabel.text = [_initialCities objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Do some stuff when the row is selected
    NSLog(@"title of cell %@", [_initialCities objectAtIndex:indexPath.row]);
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _picture.image = [UIImage imageNamed:@"image.jpg"];
    
//  myImage.image = [UIImage imageNamed:@"return_journey_denoter.png"];
    
//    UIImageView *imgview = [[UIImageView alloc]
//                            initWithFrame:CGRectMake(10, 10, 300, 400)];
//    [imgview setImage:[UIImage imageNamed:@"image.jpg"]];
//    [imgview setContentMode:UIViewContentModeScaleAspectFit];
//    [self.view addSubview:imgview];

}

//#pragma mark - TableView delegate
//-(BOOL)tableView:(UITableView *)mytable shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
//    return NO;
//}

#pragma mark - UISearchBar delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    // "if" Required to set row count for TableView.
    if (searchText.length == 0)
        _isfiltered = NO;
    else{
        _isfiltered = YES;
        _filteredCities = [[NSMutableArray alloc]init];
    }
    // "for" to cycle/initerate/enumerate through initialCities and push query results to filteredCities (FAST ENUMERATION)
    for (NSString *cityName in _initialCities){
        NSLog(@"log %@", cityName);
        NSRange cityNameRange = [cityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
        // Content of searchText is used to search in cityName. If not found searchText == NSNotFound. NSRange is used to search in strings, can be used for other string operations as well.
        if (cityNameRange.location != NSNotFound){
        //If not not found (i.e found),
            [_filteredCities addObject:cityName];
            NSString *tempDa = [NSString stringWithFormat:@"%d", cityNameRange.location];
            NSLog(@"log %@", tempDa);
            //NSStringFromRange(cityNameRange.location));
        }
    }
    [_mytable reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.view endEditing:YES]; //To hide keyboard
}



@end
