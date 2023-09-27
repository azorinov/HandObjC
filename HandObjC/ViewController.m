//
//  ViewController.m
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-26.
//

#import "ViewController.h"
#import "DrawVCWithoutNib.h"
#import "DrawVCNib.h"

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"Options"];

  self.content = @[
    @"Draw View Controller with nib", @"Draw View Controller without nib"
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
    if ([day isEqualToString:@"Draw View Controller with nib"]) {
        [self showViewController:[[DrawVCNib alloc] init]
                          sender:self];
    } else {
        [self showViewController:[[DrawVCWithoutNib alloc] init]
                          sender:self];
    }

}

@end
