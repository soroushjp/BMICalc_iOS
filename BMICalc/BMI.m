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

- (float) getBMIfromHeight:(float)height andWeight:(float) weight {
    
    if([[self units] isEqual: @"SI"]) {
        return weight/(height * height);
    }
    
    if([[self units] isEqual: @"EE"]) {
        return weight/(height * height) * 703.06957964;
    }
    
    return 0;

}

@end
