//
//  SkiSpeedViewController.h
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h> //from Joe Hoffman at http://nscookbook.com/2013/03/ios-programming-recipe-19-using-core-motion-to-access-gyro-and-accelerometer/.


float counter; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
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
    
    IBOutlet UILabel *totTime; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
    IBOutlet UILabel *curSpeed;
    IBOutlet UILabel *maxSpeed;
    IBOutlet UILabel *avgSpeed;
    
    NSTimer *clock; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
}

-(void)timer; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
-(IBAction)startTracking:(id)sender; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
-(IBAction)stopTracking:(id)sender; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
-(IBAction)resetButton:(id)sender; //this code is modeled off Matt Heaney's Timer XCode 5 Tutorial https://www.youtube.com/watch?v=Jt10xmZLcW8
-(void)outputAccelData:(CMAcceleration)acceleration;

@property (strong, nonatomic) CMMotionManager *motionManager; //from Joe Hoffman at http://nscookbook.com/2013/03/ios-programming-recipe-19-using-core-motion-to-access-gyro-and-accelerometer/.

@end
