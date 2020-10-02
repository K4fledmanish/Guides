//
//  QRCodeViewController.h
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QRCodeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startButton;

- (BOOL)startReading;

@end

NS_ASSUME_NONNULL_END
