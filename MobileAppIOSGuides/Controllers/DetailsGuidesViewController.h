//
//  DetailsGuidesViewController.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsGuidesViewController : UIViewController {
    
    NSDictionary *dictionaryBookImages;
    NSDictionary *dictionaryBookDetails;
}

@property NSString *receivedBookName;

@end

NS_ASSUME_NONNULL_END
