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
    
    [self reloadUIFromSettings];
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
    
    UserDefaults *settings = [[UserDefaults alloc] init];
    NSString *units = [settings retrieveFromUserDefaults:@"units"];
    
    float height = 0;
    float weight = 0;
    
    if(units) {
        if([units isEqual:@"SI"]) {
            height = [[_txtHeight text] floatValue];
            weight = [[_txtWeight text] floatValue];
        }
        else if([units isEqual:@"EE"]) {
            height = [[_txtHeightEE text] floatValue]*12 + [[_txtHeightEE2 text] floatValue];
            weight = [[_txtWeightEE text] floatValue];
        }
        
    }
    
    BMI *BMIObj = [[BMI alloc] init];
    [BMIObj setUnits: units];    
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

- (BOOL) reloadUIFromSettings {

    UserDefaults *settings = [[UserDefaults alloc] init];
    NSString *units = [settings retrieveFromUserDefaults:@"units"];
    
    if(units) {
        if([units isEqual:@"SI"]) {
            [_txtHeightEE setHidden:YES];
            [_txtHeightEE2 setHidden:YES];
            [_lblHeightEE setHidden:YES];
            [_lblHeightEE2 setHidden:YES];
            [_txtWeightEE setHidden:YES];
            [_lblWeightEE setHidden:YES];
            
            [_txtHeight setHidden:NO];
            [_lblHeightSI setHidden:NO];
            [_txtWeight setHidden:NO];
            [_lblWeightSI setHidden:NO];
        }
        else if([units isEqual:@"EE"]) {
            [_txtHeight setHidden:YES];
            [_lblHeightSI setHidden:YES];
            [_txtWeight setHidden:YES];
            [_lblWeightSI setHidden:YES];
            
            [_txtHeightEE setHidden:NO];
            [_txtHeightEE2 setHidden:NO];
            [_lblHeightEE setHidden:NO];
            [_lblHeightEE2 setHidden:NO];
            [_txtWeightEE setHidden:NO];
            [_lblWeightEE setHidden:NO];
        }
        
        return YES;
    }
    
   return NO;
}

@end
