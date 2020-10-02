//
//  DetailsGuidesViewController.m
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import "DetailsGuidesViewController.h"

@interface DetailsGuidesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblBookName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBook;
@property (weak, nonatomic) IBOutlet UILabel *lblBookDetails;

@end

@implementation DetailsGuidesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    dictionaryBookImages = @{
        
        @"Algorithm Design" : @"Algorithm Design.png",
        @"Algorithm for Interviews" : @"Algorithm for Interviews.png",
        @"Java 8" : @"Java 8.png",
        @"Key to Success" : @"Key to Success.png",
        @"Object Oriented vs Functional Programming" : @"Object Oriented vs Functional Programming.png",
       
    };
    
    
    
    dictionaryBookDetails = @{
        
        @"Algorithm Design" : @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        @"Algorithm for Interviews" : @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        @"Java 8" : @"JLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        @"Key to Success" : @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        @"Object Oriented vs Functional Programming" : @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
       
    };
    
    
    NSString *bookImage = dictionaryBookImages[_receivedBookName];
    _imageViewBook.image = [UIImage imageNamed:bookImage];
    
    
    _lblBookName.text = _receivedBookName;
    
    _lblBookDetails.text = dictionaryBookDetails[_receivedBookName];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
