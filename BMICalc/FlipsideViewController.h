//
//  FlipsideViewController.h
//  BMICalc
//
//  Created by Soroush Pour on 15/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDefaults.h"

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingUnits;
@property (strong, nonatomic) NSArray *unitOptions;

- (IBAction)done:(id)sender;
- (IBAction)btnAboutClicked:(id)sender;

@end
