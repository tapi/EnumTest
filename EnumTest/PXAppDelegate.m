//
//  PXAppDelegate.m
//  EnumTest
//
//  Created by Paddy O'Brien on 2013-03-20.
//  Copyright (c) 2013 500px. All rights reserved.
//
//  Tests that typedefed fixed enums work and are being displayed correctly in Xcode 4.6

#import "PXAppDelegate.h"

// ---- These produce the incorrect Format specifier --- //

//Using the new enum macro
typedef NS_ENUM(NSInteger, PXEnumTest1) {
	PXEnumTest1One = -1,
	PXEnumTest1Two
};

//Without the enum macro
typedef enum : NSInteger {
	PXEnumTest2One = -1,
	PXEnumTest2Two
} PXEnumTest2;

// ---- This is the style seen in a lot of old apple headers and appears correctly ---- //
enum : NSInteger
{
    PXEnumTest3One = -1,
    PXEnumTest3Two
};
typedef NSInteger PXEnumTest3;

@implementation PXAppDelegate

// All three of these tests should pass regardless of what version of Xcode you are using
// The result of inspecting the variables while debugging will differ depending on the version of Xcode
//
// In Xcode 4.6 the default format specifers for anything of this form, typedef enum : NSInteger, are wrong
// Has not been tested with other signed values.
// rdar://13463793
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	PXEnumTest1 testOne = PXEnumTest1One;
	if (testOne != PXEnumTest1One) {
		NSLog(@"Test One Failed. testOne is %d but should be PXEnumTest1One (%d)", testOne, PXEnumTest1One);
	}
	
	PXEnumTest2 testTwo = PXEnumTest2One;
	if (testTwo != PXEnumTest2One) {
		NSLog(@"Test Two Failed. testTwo is %d but should be PXEnumTest2One (%d)", testTwo, PXEnumTest2One);
	}
	
	PXEnumTest3 testThree = PXEnumTest3One;
	if (testThree != PXEnumTest3One) {
		NSLog(@"Test Three Failed. testOne is %d but should be PXEnumTest3One (%d)", testThree, PXEnumTest3One);
	}
	
	// Put a breakpoint here
    return YES;
}

@end
