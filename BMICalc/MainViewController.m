//
//  MainViewController.m
//  BMICalc
//
//  Created by Soroush Pour on 15/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import "MainViewController.h"

@interface UIView (FindAndResignFirstResponder)

- (BOOL)findAndResignFirstResponder;

@end

@implementation UIView (FindAndResignFirstResponder)
- (BOOL)findAndResignFirstResponder
{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    for (UIView *subView in self.subviews) {
        if ([subView findAndResignFirstResponder])
            return YES;
    }
    return NO;
}
@end

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)btnCalc:(id)sender {
    
    [self.view findAndResignFirstResponder];
    
    float height = [[_txtHeight text] floatValue];
    float weight = [[_txtWeight text] floatValue];
    
    BMI *BMIObj = [[BMI alloc] init];
    
    UserDefaults *settings = [[UserDefaults alloc] init];
    NSString *units = [settings retrieveFromUserDefaults:@"units"];
    
    NSLog(@"%@",units);
    
//    [BMIObj setUnits: @"EE"];
//    height = height*12;
    
    float BMIVal = [BMIObj getBMIfromHeight:height andWeight:weight];
    
    [_lblBMI setText:[NSString stringWithFormat:@"%.2f",BMIVal]];
}

- (IBAction)btnBack:(id)sender {
  
    [self.view findAndResignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == _txtHeight) [_txtWeight becomeFirstResponder];
    else [textField resignFirstResponder];
    
    return YES;
}
@end
