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
    clock = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}
-(IBAction)stopTracking:(id)sender{
    [clock invalidate];
}

-(IBAction)resetButton:(id)sender{
    counter =0;
    totTime.text = [NSString stringWithFormat:@"0"];
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

-(void)timer {
         counter=counter+1;
         totTime.text = [NSString stringWithFormat:@"%i", counter];
     }
     
-(void)outputData:(CMAcceleration)acceleration {
         float currSpeed;
         
         float accX = fabs(acceleration.x);
         float accY=fabs(acceleration.y);
         float accZ= fabs(acceleration.z);
         float accelerateXAndY;
         accelerateXAndY=powf(accX,2)+pow(accY,2);
         float acceleratePartOne;
         acceleratePartOne=powf(accZ,2);
         float accelerateAddZ;
         accelerateAddZ=accelerateXAndY+acceleratePartOne;
         double accelerateTotal;
         accelerateTotal=sqrtf(accelerateAddZ); //so this is the total acceleration
         
         
         
         // this is where I'm not sure what to say
         // I need to figure out how to record two different totAccelerations that are a quarter second apart and then use those to calculate the current speed
         
         //then I can use this code below to report it out
         
         double currentCurrentSpeed = currSpeed;
         double currentSpeed;
         double currentTopSpeed;
        self->curSpeed.text = [NSString stringWithFormat:@" %.1fg",currentCurrentSpeed];
         if(fabs(currentSpeed) > fabs(currentTopSpeed))
         {
             currentTopSpeed = currentSpeed;
         }
        self->maxSpeed.text = [NSString stringWithFormat:@" %.1fg",currentTopSpeed];
         
    
}
     




@end
