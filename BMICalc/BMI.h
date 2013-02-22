//
//  BMI.h
//  BMICalc
//
//  Created by Soroush Pour on 15/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMI : NSObject

@property (strong, nonatomic) NSString* units;

- (float)getBMIFromHeight:(float)height andWeight:(float) weight;
- (NSString*) getRangeFromBMI:(float)BMI;
- (UIColor*) getColorFromRange:(NSString*)range;

@end
