//
//  QRCodeViewController.m
//  MobileAppIOSGuides
//
//  Created by K4fle D. Manish on 1/10/20.
//  Copyright © 2020 K4fle D. Manish. All rights reserved.
//

#import "QRCodeViewController.h"



@interface QRCodeViewController () <AVCaptureMetadataOutputObjectsDelegate>
    
@property (nonatomic) BOOL isReading;
    
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewPlayer;
    
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;
    
@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isReading = NO;
    _captureSession = nil;
    
    [self loudBeepSound];
}
    
- (IBAction)startStopReading:(id)sender {
    if(!_isReading) {
        if([self startReading]){
            [_labelStatus setText:@"Scanning code..."];
            [_startButton setTitle:@"Stop"];
        }
    } else {
        [self stopReading];
        [_startButton setTitle:@"Start"];
    }
    _isReading = !_isReading;
}
 
- (BOOL)startReading {
    NSError *error;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if(!deviceInput) {
        NSLog(@"Error %@", error.localizedDescription);
        return NO;
    }
    
    _captureSession = [[AVCaptureSession alloc]init];
    [_captureSession addInput:deviceInput];
    
    AVCaptureMetadataOutput *capturedMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:capturedMetadataOutput];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [capturedMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [capturedMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    _videoPreviewPlayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    
    [_videoPreviewPlayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewPlayer setFrame:_viewPreview.layer.bounds];
    
    [_viewPreview.layer addSublayer:_videoPreviewPlayer];
    
    [_captureSession startRunning];
    
    
    return YES;
}
    
- (void)stopReading {
    [_captureSession stopRunning];
    _captureSession = nil;
    
    [_videoPreviewPlayer removeFromSuperlayer];
}
    
- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    if (metadataObjects != nil && metadataObjects.count > 0) {
        
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        
        if ([[metadataObject type]isEqualToString:AVMetadataObjectTypeQRCode]) {
            
            [_labelStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObject stringValue] waitUntilDone:NO];
            
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            [_startButton performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
            _isReading = NO;
            
            if (_audioPlayer) {
                [_audioPlayer play];
            }
        }
    }
}
    
- (void)loudBeepSound {
    NSString *beepFilePath = [[NSBundle mainBundle]pathForResource:@"Beep" ofType:@"mp3"];
    NSURL *beepURL = [NSURL URLWithString:beepFilePath];
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:beepURL error:&error];
    if(error) {
        NSLog(@"can not play beep file %@", error.localizedDescription);
    } else {
        [_audioPlayer prepareToPlay];
    }
    
}

@end
