DDExpandableButton
==============


Purpose
--------------

`DDExpandableButton` is a single-file iOS 3.0+ class designed to be used like an expandable `UIButton` ; as seen in the iOS Camera app for the *flash* button.

*Originally inspired by [ExpandyButton](https://github.com/iosdeveloper/ExpandyButton).*

![button samples](http://github.com/ddebin/DDExpandableButton/raw/master/README.png)


Properties
--------------

A DDExpandableButton has the following properties:

 - `@property (nonatomic,assign)	BOOL			expanded;`

	Current button status (if expanded or shrunk).

 - `@property (nonatomic,assign)	BOOL			useAnimation;`

	Use animation during button state transitions.

 - `@property (nonatomic,assign)	BOOL			toggleMode;`

	Use button as a toggle (like "HDR On" / "HDR Off" button in camera app).

 - `@property (nonatomic,assign)	CGFloat		timeout;`

	To shrink the button after a timeout. Use `0` if you want to disable timeout.

 - `@property (nonatomic,assign)	CGFloat 		horizontalPadding;`

	Horizontal padding space between items.
	
 - `@property (nonatomic,assign)	CGFloat 		verticalPadding;`

	Vertical padding space above and below items.

 - `@property (nonatomic,assign)	CGFloat 		borderWidth;`

	Width (thickness) of the button border.

 - `@property (nonatomic,assign)	CGFloat 		innerBorderWidth;`

	Width (thickness) of the inner borders between items.

 - `@property (nonatomic,assign)	NSUInteger	selectedItem;`

	Selected item number.

 - `@property (nonatomic,retain)	UIColor		*borderColor;`

	Color of the button and inner borders.

 - `@property (nonatomic,retain)	UIColor		*textColor;`

	Color of text labels.

 - `@property (nonatomic,retain)	UIFont		*labelFont;`

	Font of text labels.

 - `@property (nonatomic,retain)	UIFont		*unSelectedLabelFont;`

	Font of unselected text labels. `Nil` if not different from `labelFont`.

 - `@property (nonatomic,readonly)	NSArray 	*labels;`

	Access `UIView` used to draw labels.


Methods
--------------

A DDExpandableButton has the following methods:

 - `- (id)initWithPoint:(CGPoint)point leftTitle:(id)leftTitle buttons:(NSArray *)buttons;`

	*Init* method where you can specify `leftTitle` and `buttons`.

 - `- (void)setSelectedItem:(NSUInteger)selected animated:(BOOL)animated;`

	*Animated* version of `- (void)setSelectedItem:(NSUInteger)selected`.

 - `- (void)setExpanded:(BOOL)expanded animated:(BOOL)animated;`

	*Animated* version of `- (void)setExpanded:(BOOL)expanded`.

 - `- (void)setLeftTitle:(id)leftTitle;`

	Set left title view : you can use a `NSString`, an `UIImage` or any `UIView` (but the view must implement `DDExpandableButtonViewSource` protocol).

 - `- (void)setButtons:(NSArray *)buttons;`

	Set buttons views : you can use a `NSString`, an `UIImage` or any `UIView` (but the view must implement `DDExpandableButtonViewSource` protocol).

 - `- (void)disableTimeout;`

	If you want to disable timeout shrunk. You can set `timeout` to `0` also.

 - `- (void)updateDisplay;`

	When modifying button parameters, use this method to update button display.


Protocols
---------------

The `DDExpandableButtonViewSource` protocol, used when you specify the title or the different buttons, has the following methods:

 - `- (CGSize)defaultFrameSize;`

	Returns default frame size of the view, used when expanding the button.

 - `- (void)setHighlighted:(BOOL)highlighted;`

	*Optional*, used to change appearance of selected items.


Usage
---------------

Example : a button with four text labels and a hook when value change.

	NSArray *buttons = [NSArray arrayWithObjects:@"Black", @"Red", @"Green", @"Blue", nil];
	DDExpandableButton *colorButton = [[[DDExpandableButton alloc] initWithPoint:CGPointMake(20, 70) leftTitle:@"Color" buttons:buttons] autorelease];
	[[self view] addSubview:colorButton];
	[colorButton addTarget:self action:@selector(toggleColor:) forControlEvents:UIControlEventValueChanged];


License
---------------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
 
You should have received a copy of the GNU Lesser General Public License along with this program.  If not, see <[http://www.gnu.org/licenses/](http://www.gnu.org/licenses/)>.