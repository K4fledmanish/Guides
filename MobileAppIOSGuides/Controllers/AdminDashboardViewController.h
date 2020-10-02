//
//  AdminDashboardViewController.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FirebaseUI;
@import Firebase;
#import "FirebaseAuthenticationHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdminDashboardViewController : UIViewController

@property FIRAuthStateDidChangeListenerHandle handle;

@end

NS_ASSUME_NONNULL_END
