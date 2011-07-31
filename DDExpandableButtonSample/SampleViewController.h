//
//  SampleViewController.h
//  DDExpandableButtonSample
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SampleViewController : UIViewController
{
	AVCaptureSession *torchSession;
}

@property (nonatomic, retain) AVCaptureSession *torchSession;

@end
