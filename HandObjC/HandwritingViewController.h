//
//  HandwritingViewController.h
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

#import <UIKit/UIKit.h>


@interface HandwritingViewController : UIViewController {
    UIInterfaceOrientation  currentInterfaceOrientation;
    CGPoint lastPoint;
}
@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, strong) IBOutlet UIImageView  *handWrittingImageView;
- (IBAction)setOrientation: (UIInterfaceOrientation) toInterfaceOrientation;
@end
