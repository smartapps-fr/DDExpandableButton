//
//  SampleAppDelegate.m
//  DDExpandableButtonSample
//

#import "SampleAppDelegate.h"
#import "SampleViewController.h"


@implementation SampleAppDelegate

@synthesize window=_window;

@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self.window addSubview:self.viewController.view];
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
	[_window release];
	[_viewController release];
    [super dealloc];
}

@end
