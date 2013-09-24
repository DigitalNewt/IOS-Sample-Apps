//
//  MainViewController.m
//  CoolFace
//
//  Created by Newt on 5/9/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong) AVCaptureStillImageOutput *stillImageOutput;
@property (strong) AVCaptureVideoDataOutput *videoDataOutput;
@property (strong) dispatch_queue_t videoDataOutputQueue;
@property (strong) AVCaptureVideoPreviewLayer *previewLayer;

@property (nonatomic, strong) UIImage *square;
@property (nonatomic, strong) CIDetector * faceDetector;

@end

@implementation MainViewController

- (void)setupAVCapture
{
    NSError *error = nil;
	
	AVCaptureSession *session = [AVCaptureSession new];
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
	    [session setSessionPreset:AVCaptureSessionPreset640x480];
	else
	    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    // Select a video device, make an input
	AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&error];
    isUsingFrontFacingCamera = NO;
    
    if (error == nil) {
        if ([session canAddInput:videoInput]) {
            [session addInput:videoInput];
        }
        
        // Make a still image output
        self.stillImageOutput = [AVCaptureStillImageOutput new];
        [self.stillImageOutput addObserver:self
                                forKeyPath:@"capturingStillImage"
                                   options:NSKeyValueObservingOptionNew
                                   context:AVCaptureSessionPresetPhoto];
        if ([session canAddOutput:self.stillImageOutput]) {
            [session addOutput:self.stillImageOutput];
        }
        
        // Make a video data output
        self.videoDataOutput = [AVCaptureVideoDataOutput new];
        
        // we want BGRA, both CoreGraphics and OpenGL work well with 'BGRA'
        NSDictionary *rgbOutputSettings = [NSDictionary dictionaryWithObject:
                                           [NSNumber numberWithInt:kCMPixelFormat_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        [self.videoDataOutput setVideoSettings:rgbOutputSettings];
        [self.videoDataOutput setAlwaysDiscardsLateVideoFrames:YES]; // discard if the data output queue is blocked (as we process the still image)
        
        // create a serial dispatch queue used for the sample buffer delegate as well as when a still image is captured
        // a serial dispatch queue must be used to guarantee that video frames will be delivered in order
        // see the header doc for setSampleBufferDelegate:queue: for more information
        self.videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
        [self.videoDataOutput setSampleBufferDelegate:self queue:self.videoDataOutputQueue];
        
        if ( [session canAddOutput:self.videoDataOutput] )
            [session addOutput:self.videoDataOutput];
        [[self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:NO];
        
        effectiveScale = 1.0;
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
        [self.previewLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
        [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
        CALayer *rootLayer = [self.previewView layer];
        [rootLayer setMasksToBounds:YES];
        [self.previewLayer setFrame:[rootLayer bounds]];
        [rootLayer addSublayer:self.previewLayer];
       [session startRunning];
    }
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Failed with error %d", (int)[error code]]
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles:nil];
        [alertView show];
		[self teardownAVCapture];
    }
}

// clean up capture setup
- (void)teardownAVCapture
{
	[self.stillImageOutput removeObserver:self forKeyPath:@"isCapturingStillImage"];
	[self.previewLayer removeFromSuperlayer];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self setupAVCapture];
	self.square = [UIImage imageNamed:@"squarePNG"];
	NSDictionary *detectorOptions = [[NSDictionary alloc] initWithObjectsAndKeys:CIDetectorAccuracyLow, CIDetectorAccuracy, nil];
	self.faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:detectorOptions];
}

@end
