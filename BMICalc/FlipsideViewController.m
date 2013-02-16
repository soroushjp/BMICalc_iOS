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

@end
