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

- (float)getBMIfromHeight:(float)height andWeight:(float) weight;

@end
