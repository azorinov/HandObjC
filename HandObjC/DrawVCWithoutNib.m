//
//  DetailsController.m
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

#import "DrawVCWithoutNib.h"

@interface DrawVCWithoutNib ()
@property (strong, nonatomic) IBOutlet UIImageView *handWrittingImageView;
@property (nonatomic, strong) UIColor *currentColor;
@end

@implementation DrawVCWithoutNib

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

- (void)loadView {
    [super loadView];
    lineWidth = 10.0;
    _currentColor = [UIColor colorWithRed:0.255f/0.255f green:0.180f/0.255f blue:0.190f/0.255f alpha:1.000f];
    _handWrittingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 600)];
    _handWrittingImageView.backgroundColor = [UIColor colorWithRed:0.248f/0.255f green:0.243f/0.255f blue:0.214f/0.255f alpha:1.000f];
    [self.view addSubview:_handWrittingImageView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Drawing View"];
    self.view.backgroundColor = [UIColor colorWithRed:0.219f/0.255f green:0.211f/0.255f blue:0.174f/0.255f alpha:1.000f];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _handWrittingImageView.center = self.view.center;
}

@end
