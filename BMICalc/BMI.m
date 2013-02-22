//
//  BMI.m
//  BMICalc
//
//  Created by Soroush Pour on 15/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import "BMI.h"

@implementation BMI

- (id)init {
    self = [super init];
    
    if(self) {
        [self setUnits: @"SI"];
    }
    
    return self;
}

- (float) getBMIFromHeight:(float)height andWeight:(float) weight {
    
    if([[self units] isEqual: @"SI"]) {
        return weight/(height * height);
    }
    
    if([[self units] isEqual: @"EE"]) {
        return weight/(height * height) * 703.06957964;
    }
    
    return 0;

}

- (NSString*) getRangeFromBMI:(float)BMI {

    if(BMI<18) return @"Underweight";
    if(BMI>=18 && BMI<25) return @"Normal";
    if(BMI>=25 && BMI<30) return @"Overweight";
    if(BMI>=30) return @"Obese";
    
    return @"Undefined";
}

- (UIColor*) getColorFromRange:(NSString*)range {
    
    if([range isEqual: @"Underweight"] || [range isEqual: @"Overweight"]) {
        return [UIColor orangeColor];
    }
    
    if([range isEqual: @"Obese"]) {
        return [UIColor redColor];
    }
    
    if([range isEqual: @"Normal"]) {
        return [UIColor greenColor];
    }
    
    return [UIColor greenColor];
    
}

@end
