//
//  DDExpandableButtonSampleViewController.m
//  DDExpandableButtonSample
//

#import "SampleViewController.h"
#import "DDExpandableButton.h"

@implementation SampleViewController

@synthesize torchSession;

- (void)dealloc
{
	[torchSession release];
    [super dealloc];
}

#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
		
	DDExpandableButton *torchModeButton = [[[DDExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 20.0f)
																		   leftTitle:[UIImage imageNamed:@"Flash.png"]
																			 buttons:[NSArray arrayWithObjects:@"Auto", @"On", @"Off", nil]] autorelease];
	[[self view] addSubview:torchModeButton];
	[torchModeButton addTarget:self action:@selector(toggleFlashlight:) forControlEvents:UIControlEventValueChanged];
	[torchModeButton setVerticalPadding:6];
	[torchModeButton updateDisplay];

	[torchModeButton setSelectedItem:2];

	// Torch related settings
	// Setting up flashlight for later use...
	// cf. http://stackoverflow.com/questions/3190034#3367424
    if (NSClassFromString(@"AVCaptureDevice") != nil)
	{
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		
        if ([device hasTorch])
		{
            if (device.torchMode == AVCaptureTorchModeOff)
			{				
                AVCaptureDeviceInput *flashInput = [AVCaptureDeviceInput deviceInputWithDevice:device error: nil];
                AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
				
                AVCaptureSession *session = [[AVCaptureSession alloc] init];
				
				[session beginConfiguration];
                [device lockForConfiguration:nil];
				
                [session addInput:flashInput];
                [session addOutput:output];
				
                [device unlockForConfiguration];
				
                [output release];
				
				[session commitConfiguration];
				[session startRunning];
				
				[self setTorchSession:session];
				[session release];
			}

			[torchModeButton setSelectedItem:(2 - [device torchMode])];
        }
    }

	[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor blackColor].CGColor];

	DDExpandableButton *colorButton = [[[DDExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 65.0f)
																	   leftTitle:@"Color"
																		 buttons:[NSArray arrayWithObjects:@"Black", @"Red", @"Green", @"Blue", nil]] autorelease];
	[[self view] addSubview:colorButton];
	[colorButton addTarget:self action:@selector(toggleColor:) forControlEvents:UIControlEventValueChanged];

	[[colorButton.labels objectAtIndex:0] setHighlightedTextColor:[UIColor blackColor]];
	[[colorButton.labels objectAtIndex:1] setHighlightedTextColor:[UIColor redColor]];
	[[colorButton.labels objectAtIndex:2] setHighlightedTextColor:[UIColor greenColor]];
	[[colorButton.labels objectAtIndex:3] setHighlightedTextColor:[UIColor blueColor]];
	
	DDExpandableButton *borderButton = [[[DDExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 110.0f)
																		leftTitle:@"Border"
																		  buttons:[NSArray arrayWithObjects:@"Thin", @"Medium", @"Thick", nil]] autorelease];
	[[self view] addSubview:borderButton];
	[borderButton addTarget:self action:@selector(toggleWidth:) forControlEvents:UIControlEventValueChanged];
	[borderButton setInnerBorderWidth:0];
	[borderButton setHorizontalPadding:6];
	[borderButton setUnSelectedLabelFont:[UIFont systemFontOfSize:borderButton.labelFont.pointSize]];
	[borderButton updateDisplay];
	[borderButton setSelectedItem:1];

	DDExpandableButton *toggleButton = [[[DDExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 155.0f)
																		leftTitle:nil
																		  buttons:[NSArray arrayWithObjects:@"HDR On", @"HDR Off", nil]] autorelease];
	[[self view] addSubview:toggleButton];
	[toggleButton addTarget:self action:@selector(toggleBkgd:) forControlEvents:UIControlEventValueChanged];
	[toggleButton setToggleMode:YES];
	[toggleButton setInnerBorderWidth:0];
	[toggleButton setHorizontalPadding:6];
	[toggleButton updateDisplay];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	self.torchSession = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

#pragma mark UIControlEventValueChanged selectors

- (void)toggleColor:(DDExpandableButton *)sender
{
	switch ([sender selectedItem])
	{
		default:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor blackColor].CGColor];
			break;
		case 1:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor redColor].CGColor];
			break;
		case 2:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor greenColor].CGColor];
			break;
		case 3:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor blueColor].CGColor];
			break;
	}
}

- (void)toggleWidth:(DDExpandableButton *)sender
{
	switch ([sender selectedItem])
	{
		default:
			[[[self.view viewWithTag:10] layer] setBorderWidth:2];
			break;
		case 1:
			[[[self.view viewWithTag:10] layer] setBorderWidth:6];
			break;
		case 2:
			[[[self.view viewWithTag:10] layer] setBorderWidth:12];
			break;
	}
}
- (void)toggleBkgd:(DDExpandableButton *)sender
{
	switch ([sender selectedItem])
	{
		case 0:
			[self.view setBackgroundColor:[UIColor grayColor]];
			break;
		case 1:
			[self.view setBackgroundColor:[UIColor lightGrayColor]];
			break;
	}
}

- (void)toggleFlashlight:(DDExpandableButton *)sender
{
	if (NSClassFromString(@"AVCaptureDevice") != nil)
	{
		AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		
		if ([device hasTorch])
		{
			[device lockForConfiguration:nil];
			[device setTorchMode:(2 - [sender selectedItem])];
			[device unlockForConfiguration];
		}		
	}
}

@end
