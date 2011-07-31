//
//  SampleAppDelegate.h
//  DDExpandableButtonSample
//

#import <UIKit/UIKit.h>

@class SampleViewController;

@interface SampleAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SampleViewController *viewController;

@end
