//
//  MapRoutesViewController.m
//  Jogr
//
//  Created by Newt on 9/23/13.
//  Copyright (c) 2013 Xcode. All rights reserved.
//

#import "MapRoutesViewController.h"

@interface MapRoutesViewController ()

@end

@implementation MapRoutesViewController

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

-(IBAction)tapInMapView:(UIGestureRecognizer *)gestureRecognizer
{
    //CGPoint locationInView = [gestureRecognizer locationInView:_mapView];
    
}

@end
