//
//  HandwritingViewController.m
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

#import "HandwritingViewController.h"

@interface HandwritingViewController ()

@end

@implementation HandwritingViewController

float lineWidth = 10.0;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:_handWrittingImageView];
    lastPoint.y -= 2.0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:_handWrittingImageView];
    currentPoint.y -= 2.0;
    UIGraphicsBeginImageContext(_handWrittingImageView.frame.size);
    [_handWrittingImageView.image drawInRect:CGRectMake(0, 0, _handWrittingImageView.frame.size.width, _handWrittingImageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(),lineWidth);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), _currentColor.CGColor);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    _handWrittingImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIGraphicsBeginImageContext(_handWrittingImageView.frame.size);
    [_handWrittingImageView.image drawInRect:CGRectMake(0, 0, _handWrittingImageView.frame.size.width, _handWrittingImageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), lineWidth);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), _currentColor.CGColor);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    CGContextFlush(UIGraphicsGetCurrentContext());
    _handWrittingImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_handWrittingImageView];
    
    _currentColor = [UIColor colorWithRed:0.250f/0.255f green:0.055f/0.255f blue:0.1f/0.255f alpha:1.000f];
    _handWrittingImageView.frame = CGRectMake(0, 0, 300, 500);
}

- (IBAction)setOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    currentInterfaceOrientation = toInterfaceOrientation;
}

-(UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}


@end
