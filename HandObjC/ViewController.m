//
//  ViewController.m
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

#import "ViewController.h"
#import "DrawControllerWithoutNib.h"
#import "HandwritingViewController.h"

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"Options"];

  self.content = @[
    @"Handwriting with nib", @"Handwriting without nib"
  ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [self.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"my-table";
  UITableViewCell *cell =
      [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:cellIdentifier];
  }

  cell.textLabel.text = [self.content objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *day = [self.content objectAtIndex:indexPath.row];
    if ([day isEqualToString:@"Handwriting with nib"]) {
        [self showViewController:[[HandwritingViewController alloc] init]
                          sender:self];
    } else {
        [self showViewController:[[DrawControllerWithoutNib alloc] initWithText:day]
                          sender:self];
    }

}

@end
