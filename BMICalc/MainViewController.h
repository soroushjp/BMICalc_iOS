//
//  MainViewController.h
//  BMICalc
//
//  Created by Soroush Pour on 15/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import "FlipsideViewController.h"
#import "BMI.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

- (IBAction)showInfo:(id)sender;

- (IBAction)btnCalc:(id)sender;
- (IBAction)btnBack:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblBMI;
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;


@end
