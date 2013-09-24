//
//  RunViewController.m
//  Jogr
//
//  Created by Newt on 9/21/13.
//  Copyright (c) 2013 Xcode. All rights reserved.
//

#import "RunViewController.h"

@interface RunViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *pauseRunButton;
@property (nonatomic, assign) NSTimeInterval start;
@property (nonatomic, assign) NSTimeInterval pause;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation RunViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)timeStringForInterval:(NSTimeInterval)interval
{
    long hours = (long)interval /60l;
    long minutes = ((long)interval /60l) %60l;
    long seconds = (long)interval % 60l;
    long hundredths = (long)(interval * 100.0) % 100l;
    
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld.%02ld", hours, minutes, seconds, hundredths];
}

- (void)updateTime
{
    if (_timer) {
        NSTimeInterval now = _pause ? _pause : [NSDate timeIntervalSinceReferenceDate];
        NSString *string = [self timeStringForInterval:now - _start];
        
        [_timeLabel setText:string];
    }
}

- (IBAction)pauseOrRun:(id)sender
{
    if (_start == 0) {
        _start = [NSDate timeIntervalSinceReferenceDate];
    }
    
    if (_timer == nil) {
        _pause = 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        [_timer fire];
        [self.pauseRunButton setTitle:@"PAUSE" forState:UIControlStateNormal];
                  
    } else {
        _pause = [NSDate timeIntervalSinceReferenceDate];
        [_timer invalidate];
        _timer=nil;

        [self.pauseRunButton setTitle:@"START" forState:UIControlStateNormal];
    }
}

@end
