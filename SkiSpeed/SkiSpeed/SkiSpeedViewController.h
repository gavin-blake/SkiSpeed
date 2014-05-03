//
//  SkiSpeedViewController.h
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


float counter;
float currentTopSpeed;
float initVelocity;
float currentVelocity;
float initAcceleration;
double accelerateTotal;
double changeInAcceleration;
double minusVelocity;
float topSpeed;
float currSpeed;
float gettingAverageVelocity;
float averageVelocity;

@interface SkiSpeedViewController : UIViewController {
    IBOutlet UILabel *totTime;
    IBOutlet UILabel *curSpeed;
    IBOutlet UILabel *maxSpeed;
    IBOutlet UILabel *avgSpeed;
    
    NSTimer *clock;
}

-(void)timer;
-(IBAction)startTracking:(id)sender;
-(IBAction)stopTracking:(id)sender;
-(IBAction)resetButton:(id)sender;
-(void)findMaxSpeed;
-(void)outputAccelData;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end
