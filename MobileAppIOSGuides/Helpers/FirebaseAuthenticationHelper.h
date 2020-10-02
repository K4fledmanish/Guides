//
//  FirebaseAuthenticationHelper.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <Foundation/Foundation.h>
@import FirebaseAuth;

NS_ASSUME_NONNULL_BEGIN

@interface FirebaseAuthenticationHelper : NSObject

+(void)signOut:(UIViewController*)theViewControllerToDismiss;

@end

NS_ASSUME_NONNULL_END
