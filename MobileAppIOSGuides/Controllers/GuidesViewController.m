//
//  GuidesViewController.m
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import "GuidesViewController.h"
#import "DetailsGuidesViewController.h"

@interface GuidesViewController ()

@end

@implementation GuidesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrListOfSectionHeaderTitles = @[@"A", @"J", @"K", @"O"];
    
    
    arrListOfBookNames = @[
                                @[@"Algorithm Design", @"Algorithm for Interviews"],
                                @[@"Java 8"],
                                @[@"Key to Success"],
                                @[@"Object Oriented vs Functional Programming"]
                            ];
    
    arrListOfBookImages = @[
                                @[@"Algorithm Design.png", @"Algorithm for Interviews.png"],
                                @[@"Java 8.png"],
                                @[@"Key to Success.png"],
                                @[@"Object Oriented vs Functional Programming.png"]
                            ];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [arrListOfSectionHeaderTitles count];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [arrListOfBookNames[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return arrListOfSectionHeaderTitles[section];
}




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
       NSString *simpleidentifier = @"simpleIdentifier";
       UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleidentifier forIndexPath:indexPath];
       
       // Configure the cell...
       
       
       cell.textLabel.text = arrListOfBookNames[indexPath.section][indexPath.row];
       cell.detailTextLabel.text = @"View";
    
       
       
       
       
       NSString *imageName = arrListOfBookImages[indexPath.section][indexPath.row];
       
       UIImage *image = [UIImage imageNamed:imageName];
       cell.imageView.image = image;
       
       
       return cell;
       
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"Irem Clocked at %ld, %ld",(long)indexPath.section, (long)indexPath.row);
//    NSString *itemClicked = arrListOfBookNames[indexPath.section][indexPath.row];
//    NSLog(@"itemClicked = %@", itemClicked);
//
//
//    //Configuring and presenting alert
//
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Clicked" message:itemClicked preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
//
//    [alert addAction:defaultAction];
//    [self presentViewController:alert animated:YES completion:nil];
    
    //NSString *itemClicked = arrListOfBookNames[indexPath.section][indexPath.row];
    
    NSString *itemClicked = arrListOfBookNames[indexPath.section][indexPath.row];

    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsGuidesViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"DetailsGuidesViewController"];

    //configure the view controller

    myVC.receivedBookName = itemClicked;
  


    //display vire controller

    [self presentViewController:myVC animated:YES completion:nil];

}
@end
