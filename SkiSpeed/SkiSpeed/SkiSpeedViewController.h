//
//  SkiSpeedViewController.h
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


int counter;
float currentTopSpeed;

@interface SkiSpeedViewController : UIViewController {
    IBOutlet UILabel *totTime;
    IBOutlet UILabel *curSpeed;
    IBOutlet UILabel *maxSpeed;
    IBOutlet UILabel *avgSpeed;
    IBOutlet UILabel *distTravel;
    
    NSTimer *clock;
}

-(void)timer;
-(IBAction)startTracking:(id)sender;
-(IBAction)stopTracking:(id)sender;
-(IBAction)resetButton:(id)sender;
-(void)OutputData;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end
