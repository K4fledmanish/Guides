//
//  ViewController.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FirebaseUI;
@import Firebase;

@interface LoginViewController : UIViewController <FUIAuthDelegate>

@property FIRFirestore *db;
@property FIRAuthStateDidChangeListenerHandle handle;

@end

