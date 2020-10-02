//
//  ViewController.m
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import "LoginViewController.h"
#import "AdminNavigationController.h"

#import "UserTabBarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [self initComponents];
    
    // This will show the status of user i.e. Signed in or Signed out
    
    self.handle = [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
        NSLog(@"Login Status Changed ----------------------------");
            
        if (user == nil){
            NSLog(@"In addAuthStateDidChangeListener. user == nul is TRUE --------------------");
            NSLog(@"The user is not singned in. The user has Signed out --------------------");
        } else {
            NSLog(@"In addAuthStateDidChangeListener. user == nul is False --------------------");
            NSLog(@"The user is not singned in. The user has Signed in --------------------");
        }
    }];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [[FIRAuth auth] removeAuthStateDidChangeListener:_handle];
}


//If you enabled Google or Facebook sign-in, implement a handler for the result of the Google and Facebook sign-up flows:

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
  NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
  return [[FUIAuth defaultAuthUI] handleOpenURL:url sourceApplication:sourceApplication];
}

//After you present the authentication view and the user signs in, the result is returned to the FirebaseUI Auth delegate in the didSignInWithUser:error: method:

- (void)authUI:(FUIAuth *)authUI didSignInWithUser:(nullable FIRUser *)user error:(nullable NSError *)error
{
  // Implement this method to handle signed in user or error if any.
    if (user == nil) {
        NSLog(@"Login Unsuccessful-----------------------------------------------");
    } else {
        NSLog(@"Login Successful--------------------------------------------------");
        [self showDashBoardVC];
    }
}


- (void)authUI:(FUIAuth *)authUI didSignInWithAuthDataResult:(nullable FIRAuthDataResult *)authDataResult error:(nullable NSError *)error {
   
    if (authDataResult.additionalUserInfo.isNewUser){
         NSLog(@"New User---------------------------------");
        
        [self saveNewUserProfileData:authDataResult.user];
        
    } else{
        NSLog(@"Existing user------------------");
    }
   
    
}




- (IBAction)loginClicked:(id)sender {
    
    if ([[[FIRAuth auth] currentUser] uid] != nil ){
        [self showDashBoardVC];
        
    } else {
         [self showLoginVC];
    }
    
   
}

-(void)initComponents{
    
    self.db = [FIRFirestore firestore];
    
}


-(void)showLoginVC{
   
    FUIAuth *authUI = [FUIAuth defaultAuthUI];
    // You need to adopt a FUIAuthDelegate protocol to receive callback
    authUI.delegate = self;
    
    
    //NSArray<id<FUIAuthProvider>> *providers = @[
    //  [[FUIGoogleAuth alloc] init],
    //  [[FUIFacebookAuth alloc] init],
    //  [[FUITwitterAuth alloc] init],
    //  [[FUIPhoneAuth alloc] initWithAuthUI:[FUIAuth defaultAuthUI]]
    //];
    //_authUI.providers = providers;


    NSArray<id<FUIAuthProvider>> *providers = @[
      [[FUIGoogleAuth alloc] init],
      [[FUIEmailAuth alloc] init]
    ];
    authUI.providers = providers;
    
    
    UINavigationController *authViewController = [authUI authViewController];
    [self presentViewController:authViewController animated:YES completion:nil];
}


- (void)showDashBoardVC{
    FIRUser *currentuser = [[FIRAuth auth] currentUser];
    NSString* email = currentuser.email;
    
    [[[self.db collectionWithPath:@"admins"] queryWhereField:@"email" isEqualTo:email]
        getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else if ((snapshot != nil) &&  (snapshot.empty == false)){
              NSLog(@"This is admin user---------------");
              
              // This is admin user and it will redirect to admin dashboard
              
              UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
              
              AdminNavigationController *objAdminNavigationController = (AdminNavigationController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"AdminNavigationController"];
              
              // useed to show UIViewCOntroller in modal transition
              
              [self presentViewController:objAdminNavigationController animated:YES completion:nil];
              
              
              
          }else {
              NSLog(@"This is normal user------------------------");
              
              
              // This is admin user and it will redirect to admin dashboard
              
              UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
              
              UserTabBarViewController *objUserTabBarViewController = (UserTabBarViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"UserTabBarViewController"];
              
              // useed to show UIViewCOntroller in modal transition
              
              [self presentViewController:objUserTabBarViewController animated:YES completion:nil];
              
              
              
          }
        }];

    
    
}


- (void) saveNewUserProfileData:(FIRUser*)user {
    
    // Add a new document in collection "cities"
    [[[self.db collectionWithPath:@"users"] documentWithPath:user.uid] setData:@{
        @"email": user.email,
        @"firstName": @"default",
        @"lastName": @"default",
        @"profileImageURL": @"default"
    } completion:^(NSError * _Nullable error) {
      if (error != nil) {
        NSLog(@"Error writing document: %@", error);
      } else {
        NSLog(@"Document successfully written!");
      }
    }];
}



@end
