//
//  DetailsController.m
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

#import "DrawControllerWithoutNib.h"

@implementation DrawControllerWithoutNib

- (id)initWithText:(NSString *)details {
  self = [super init];
  [self setContent:details];
  return self;
}

- (void)loadView {
  [super loadView];
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
  [label setText:self.content];
  [label setBackgroundColor:[UIColor systemBackgroundColor]];
  [label setTextAlignment:NSTextAlignmentCenter];
  self.view = label;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"My Child View"];
}

@end
