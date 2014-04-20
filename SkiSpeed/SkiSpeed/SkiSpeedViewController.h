//
//  SkiSpeedViewController.h
//  SkiSpeed
//
//  Created by Gavin B. on 4/1/14.
//  Copyright (c) 2014 Gavin B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

double totalTime;
double currentSpeed;
double topSpeed;
double averageSpeed;
double distanceTravelled;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *totTime;
@property (strong, nonatomic) IBOutlet UILabel *curSpeed;
@property (strong, nonatomic) IBOutlet UILabel *maxSpeed;
@property (strong, nonatomic) IBOutlet UILabel *avgSpeed;
@property (strong, nonatomic) IBOutlet UILabel *distTravel;



- (IBAction)resetMaxValues:(id)sender;

@end
