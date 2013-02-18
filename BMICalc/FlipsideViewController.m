//
//  FlipsideViewController.m
//  BMICalc
//
//  Created by Soroush Pour on 15/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Set settings to those loaded from NSUserDefaults
    NSString *unitOptionsStr[2] = {@"SI", @"EE"};
    _unitOptions = [NSArray arrayWithObjects:unitOptionsStr count:2];
    
    NSString* units;
    
    UserDefaults *settings = [[UserDefaults alloc] init];
    units = [settings retrieveFromUserDefaults:@"units"];
    
    if(units) {
        [_settingUnits setSelectedSegmentIndex:[_unitOptions indexOfObject:units]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    NSString *units;
    
    units = _unitOptions[[_settingUnits selectedSegmentIndex]];
    
    UserDefaults *settings = [[UserDefaults alloc] init];

    [settings savetoUserDefaults:units asKey:@"units"];
    
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)btnAboutClicked:(id)sender {
    
    UIAlertView *aboutMsg = [[UIAlertView alloc] initWithTitle:@"About BMICalc" message:@"Developed by Soroush Pour\nTested by Tom Boyle\nTested by Fabio Berger\n\nThis app is Open Source. Find the code at:\n https://github.com/soroushjp/bmicalc_ios" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
//    for (UIView *view in aboutMsg.subviews) {
//        if([[view class] isSubclassOfClass:[UILabel class]]) {
//            ((UILabel*)view).textAlignment = UITextAlignmentLeft;
//        }
//    }
    
    [aboutMsg show];
    
}

@end
