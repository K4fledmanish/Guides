//
//  GuidesViewController.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuidesViewController : UIViewController < UITableViewDataSource, UITableViewDelegate >{
    
    NSArray *arrListOfSectionHeaderTitles;
    NSArray *arrListOfBookNames;
    NSArray *arrListOfBookImages;
}

@end

NS_ASSUME_NONNULL_END
