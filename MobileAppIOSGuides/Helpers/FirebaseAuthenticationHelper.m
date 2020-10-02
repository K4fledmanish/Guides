//
//  FirebaseAuthenticationHelper.m
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import "FirebaseAuthenticationHelper.h"


@implementation FirebaseAuthenticationHelper


+(void)signOut:(UIViewController*)theViewControllerToDismiss {
    
    NSError *signOutError;
    
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status){
        NSLog(@"Error Signing out: %@", signOutError);
        return;
    } else {
        NSLog(@"[FIRAuth auth] signOut Successful------------------");
        [theViewControllerToDismiss dismissViewControllerAnimated:TRUE completion:nil];
    }
    
}

@end
