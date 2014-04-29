//
//  SkiSpeedViewController.m
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import "SkiSpeedViewController.h"

@interface UIViewController ()


@end

@implementation SkiSpeedViewController

-(IBAction)startTracking:(id)sender{
    clock = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}

-(IBAction)stopTracking:(id)sender{
    [clock invalidate];
}

-(IBAction)resetButton:(id)sender{
    initVelocity=0;
    initAcceleration=0;
    counter =0;
    topSpeed=0;
    totTime.text = [NSString stringWithFormat:@"0"];
    maxSpeed.text = [NSString stringWithFormat:@"0"];
    curSpeed.text = [NSString stringWithFormat:@"0"];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputData:accelerometerData.acceleration];
                                                 if(error){
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
}

-(void)outputData:(CMAcceleration)acceleration {
    float accX = fabs(acceleration.x);
    float accY=fabs(acceleration.y);
    float accZ= fabs(acceleration.z);
    float accelerateXAndY;
    accelerateXAndY=powf(accX,2)+pow(accY,2);
    float acceleratePartOne;
    acceleratePartOne=powf(accZ,2);
    float accelerateAddZ;
    accelerateAddZ=accelerateXAndY+acceleratePartOne;
    
    accelerateTotal=sqrtf(accelerateAddZ); //so this is the total acceleration...
    changeInAcceleration=accelerateTotal-initAcceleration;
}


-(void)timer {
    counter=counter+0.25;
    totTime.text = [NSString stringWithFormat:@"%.2f", counter];
    minusVelocity=changeInAcceleration*counter;  //everytime the timer fires, it will do all this code
    currentVelocity=initVelocity+minusVelocity;
    curSpeed.text = [NSString stringWithFormat:@"%.1f", currentVelocity];
    initVelocity=currentVelocity;
    initAcceleration=accelerateTotal;
}
     
-(void)findMaxSpeed {
    if (currentVelocity > topSpeed) {
        topSpeed=currentVelocity;
        maxSpeed.text = [NSString stringWithFormat:@"%.1f", topSpeed];
    }
}

-(void)findAverageSpeed {
    //average speed code goes here
}




@end
