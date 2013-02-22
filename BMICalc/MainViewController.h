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

- (BOOL) reloadUIFromSettings;

- (IBAction)showInfo:(id)sender;

- (IBAction)btnCalc:(id)sender;
- (IBAction)btnBack:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblBMI;
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblHeightSI;
@property (weak, nonatomic) IBOutlet UILabel *lblWeightSI;
@property (weak, nonatomic) IBOutlet UITextField *txtHeightEE;
@property (weak, nonatomic) IBOutlet UITextField *txtHeightEE2;
@property (weak, nonatomic) IBOutlet UITextField *txtWeightEE;
@property (weak, nonatomic) IBOutlet UILabel *lblHeightEE;
@property (weak, nonatomic) IBOutlet UILabel *lblHeightEE2;
@property (weak, nonatomic) IBOutlet UILabel *lblWeightEE;
@property (weak, nonatomic) IBOutlet UILabel *lblBMIDesc;
@property (weak, nonatomic) IBOutlet UILabel *lblBMIRange;
@property (weak, nonatomic) IBOutlet UILabel *lblError;


@end
