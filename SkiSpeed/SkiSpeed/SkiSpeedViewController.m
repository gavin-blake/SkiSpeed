//
//  SkiSpeedViewController.m
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import "SkiSpeedViewController.h"

@interface UIViewController ()

- (void)viewDidLoad
{
    [super viewDidLoad]
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    currentTotalTime = 0;
    currentCurrentSpeed = 0;
    currentTopSpeed = 0;
    currentAverageSpeed = 0;
    currentDistanceTravelled=0;
    
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .25;

    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                                 [self outputData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    
}
  -(void)outputData:(CMAcceleration)acceleration {
      double currSpeed;
      double accX = acceleration.x;
      double accY=acceleration.y;
      double accZ= acceleration.z;
      double accleration=sqrt(((sqrt(((accX)^2)+((accY)^2)))^2)+((accZ)^2));
      
      
      // this is where I'm not sure what to say
      // I need to figure out how to record two different totAccelerations that are a quarter second apart and then use those to calculate the current speed
      
      //then I can use this code below to report it out
      
      
      currentCurrentSpeed = currentSpeed;
      self.curSpeed.text = [NSString stringWithFormat:@" %.2fg",currentCurrentSpeed];
      if(fabs(currentSpeed) > fabs(currentTopSpeed))
        {
            currentTopSpeed = currentSpeed;
        }
      
      self.topSpeed.text = [NSString stringWithFormat:@" %.2f",currentTopSpeed];
     
        
    }
      
- (IBAction)resetMaxValues:(id)sender {
          
          currentMaxAccelX = 0;
          currentMaxAccelY = 0;
          currentMaxAccelZ = 0;
          
          
      }

@end
