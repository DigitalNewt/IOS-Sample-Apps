//
//  ViewController.m
//  SunglassesDemo
//
//  Created by Salik Syed on 10/21/11.
//  Copyright (c) 2011 Stanford. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (nonatomic,strong) AVCaptureSession * session;
@property (strong) AVCaptureDevice * videoDevice;  
@property (strong) AVCaptureDeviceInput * videoInput; 
@property (strong) AVCaptureVideoDataOutput * frameOutput; 
@property (nonatomic,strong) IBOutlet UIImageView* imgView;
@property (nonatomic,strong) CIDetector * faceDetector;
@property (nonatomic,strong) CIContext * context;
@property (nonatomic,strong) UIImageView * glasses;
@end

@implementation ViewController
@synthesize session=_session;
@synthesize videoInput = _videoInput;
@synthesize videoDevice = _videoDevice;
@synthesize frameOutput=_frameOutput;
@synthesize imgView = _imgView;
@synthesize faceDetector = _faceDetector;
@synthesize context=_context;
@synthesize glasses=_glasses;

-(CIContext*) context{
    if(!_context){
        _context = [CIContext contextWithOptions:nil];   
    }
    return _context;
}

-(CIDetector*) faceDetector{
    if(!_faceDetector){
        NSDictionary *detectorOptions = [NSDictionary dictionaryWithObjectsAndKeys:CIDetectorAccuracyLow,CIDetectorAccuracy,nil];
        
        _faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace 
                                               context:nil options:detectorOptions];
    }
    return _faceDetector;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


-(void) captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
    CVPixelBufferRef pb = CMSampleBufferGetImageBuffer(sampleBuffer);
    CIImage *ciImage = [CIImage imageWithCVPixelBuffer:pb];
    
    
    // pass detector the image:
    NSArray * features = [self.faceDetector featuresInImage:ciImage];
    bool faceFound = false;
    for(CIFaceFeature * face in features){
        if(face.hasLeftEyePosition && face.hasRightEyePosition){
            CGPoint eyeCenter = CGPointMake(face.leftEyePosition.x*0.5+face.rightEyePosition.x*0.5, face.leftEyePosition.y*0.5+face.rightEyePosition.y*0.5);

            // set the glasses position based on mouth position
            double scalex =self.imgView.bounds.size.height/ciImage.extent.size.width;
            double scaley =self.imgView.bounds.size.width/ciImage.extent.size.height;
            self.glasses.center = CGPointMake(scaley*eyeCenter.y-self.glasses.bounds.size.height/4.0,scalex*(eyeCenter.x));
            
            
            // set the angle of the glasses using eye deltas
            double deltax = face.leftEyePosition.x-face.rightEyePosition.x;
            double deltay = face.leftEyePosition.y-face.rightEyePosition.y;
            double angle = atan2(deltax, deltay);
            self.glasses.transform=CGAffineTransformMakeRotation(angle+M_PI);
            
            // set size based on distance between the two eyes:
            double scale = 3.0*sqrt(deltax*deltax+deltay*deltay);
            self.glasses.bounds = CGRectMake(0, 0, scale, scale);
            faceFound = true;

            break;
        }
        
    }
    
    if(faceFound){
        [self.glasses setHidden:NO];
    }else{
        [self.glasses setHidden:YES];
    }
    
    // apply hue adjustment filter:
    CIFilter * filter = [CIFilter filterWithName:@"CIHueAdjust"];
    [filter setDefaults];
    [filter setValue:ciImage forKey:@"inputImage"];
    [filter setValue:[NSNumber numberWithFloat:2.0] forKey:@"inputAngle"];
    CIImage * result = [filter valueForKey:@"outputImage"];
    
    

    CGImageRef ref = [self.context createCGImage:result fromRect:ciImage.extent];
    self.imgView.image = [UIImage imageWithCGImage:ref scale:1.0 orientation:UIImageOrientationRight];
    CGImageRelease(ref);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.session = [[AVCaptureSession alloc] init];
    self.session.sessionPreset = AVCaptureSessionPreset352x288;
    self.videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.videoInput =[AVCaptureDeviceInput deviceInputWithDevice:self.videoDevice error:nil];
    self.frameOutput = [[AVCaptureVideoDataOutput alloc] init];
    self.frameOutput.videoSettings = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    
    [self.session addInput:self.videoInput];
    [self.session addOutput:self.frameOutput];
    
    [self.frameOutput setSampleBufferDelegate:self queue:dispatch_get_main_queue()];
    [self.session startRunning];
    
    self.glasses = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"glasses.png"]];
    [self.glasses setHidden:YES];
    [self.view addSubview:self.glasses];
    
}



@end
