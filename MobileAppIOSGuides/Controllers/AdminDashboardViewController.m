//
//  AdminDashboardViewController.m
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import "AdminDashboardViewController.h"

@interface AdminDashboardViewController ()

@end

@implementation AdminDashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
 
    
    // This will show the status of user i.e. Signed in or Signed out
    
    self.handle = [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
        NSLog(@"Login Status Changed ----------------------------");
            
        if (user == nil){
            NSLog(@"In addAuthStateDidChangeListener. user == nul is TRUE --------------------");
            NSLog(@"The user is not singned in. The user has Signed out --------------------");
            [self dismissViewControllerAnimated:TRUE completion:nil];
            
        } else {
            NSLog(@"In addAuthStateDidChangeListener. user == nul is False --------------------");
            NSLog(@"The user is not singned in. The user has Signed in --------------------");
        }
    }];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[FIRAuth auth] removeAuthStateDidChangeListener:_handle];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)signOutClicked:(id)sender {
    [FirebaseAuthenticationHelper signOut:self];
}

@end
