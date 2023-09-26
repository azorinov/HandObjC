//
//  DetailsController.h
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

@import UIKit;

@interface DrawControllerWithoutNib : UIViewController

@property(strong, nonatomic) NSString *content;

- (id)initWithText:(NSString *)details;

@end
