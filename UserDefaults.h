//
//  UserDefaults.h
//  BMICalc
//
//  Created by Soroush Pour on 16/02/13.
//  Copyright (c) 2013 Soroush Pour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject

- (NSString*)retrieveFromUserDefaults:(NSString*)myKey;
- (BOOL)savetoUserDefaults:(NSString*)myVal asKey:(NSString*)myKey;

@end
