//
//  UserDashboardViewController.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirebaseAuthenticationHelper.h"
@import FirebaseUI;
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface UserDashboardViewController : UIViewController

@property FIRAuthStateDidChangeListenerHandle handle;

@end



NS_ASSUME_NONNULL_END
