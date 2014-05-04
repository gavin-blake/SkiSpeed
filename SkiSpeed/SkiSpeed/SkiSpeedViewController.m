//
//  SkiSpeedViewController.m
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import "SkiSpeedViewController.h"

@interface SkiSpeedViewController ()


@end

@implementation SkiSpeedViewController

-(IBAction)startTracking:(id)sender{ //modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
    clock = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}

-(IBAction)stopTracking:(id)sender{ //modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
    [clock invalidate];
}

-(IBAction)resetButton:(id)sender{ //some of this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8https://www.youtube.com/watch?v=Jt10xmZLcW8
    initVelocity=0;
    initAcceleration=0;
    counter =0;
    topSpeed=0;
    gettingAverageVelocity=0;
    averageVelocity=0;
    totTime.text = [NSString stringWithFormat:@"0"];
    maxSpeed.text = [NSString stringWithFormat:@"0"];
    curSpeed.text = [NSString stringWithFormat:@"0"];
    avgSpeed.text = [NSString stringWithFormat:@"0"];
    
}

- (void)viewDidLoad //all of the code under viewDidLoad is copied from Joe Hoffman at http://nscookbook.com/2013/03/ios-programming-recipe-19-using-core-motion-to-access-gyro-and-accelerometer/.
{
    [super viewDidLoad];
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelData:accelerometerData.acceleration];
                                                 if(error){
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
}

-(void)outputAccelData:(CMAcceleration)acceleration {
    float accX = fabsf(acceleration.x); //modeled off Joe Hoffman at http://nscookbook.com/2013/03/ios-programming-recipe-19-using-core-motion-to-access-gyro-and-accelerometer/.
    float accY=fabsf(acceleration.y); //modeled off Joe Hoffman at http://nscookbook.com/2013/03/ios-programming-recipe-19-using-core-motion-to-access-gyro-and-accelerometer/.
    float accZ= fabsf(acceleration.z); //modeled off Joe Hoffman at http://nscookbook.com/2013/03/ios-programming-recipe-19-using-core-motion-to-access-gyro-and-accelerometer/.
    float accelerateXAndY;
    accelerateXAndY=powf(accX,2)+pow(accY,2);
    float acceleratePartOne;
    acceleratePartOne=powf(accZ,2);
    float accelerateAddZ;
    accelerateAddZ=accelerateXAndY+acceleratePartOne;
    
    accelerateTotal=sqrtf(accelerateAddZ); //so this is the total acceleration...
    changeInAcceleration=accelerateTotal-initAcceleration;
}


-(void)timer { //My 3D printing teacher, Dr. Bricker, helped me think up how to use this to check velocity.
    counter=counter+0.25; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
    totTime.text = [NSString stringWithFormat:@"%.2f", counter]; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
    minusVelocity=changeInAcceleration*counter;
    currentVelocity=initVelocity+minusVelocity;
    curSpeed.text = [NSString stringWithFormat:@"%.1f", fabsf(currentVelocity)];
    gettingAverageVelocity=gettingAverageVelocity+currentVelocity;
    averageVelocity=gettingAverageVelocity/counter;
    initVelocity=currentVelocity;
    initAcceleration=accelerateTotal;
    avgSpeed.text=[NSString stringWithFormat:@"%.1f", fabsf(averageVelocity)];
    if (currentVelocity > topSpeed) {
        topSpeed=currentVelocity;
        maxSpeed.text = [NSString stringWithFormat:@"%.1f", fabsf(topSpeed)];
    }
}





@end
