//
//  SceneDelegate.m
//  HandObjC
//
//  Created by Alexander Zorinov on 2023-09-24.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.windowScene = (UIWindowScene *)scene;
    
    ViewController *viewController = [[ViewController alloc] init];
    viewController.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: viewController];
    [self.window makeKeyAndVisible];
    
    //MARK: init with nib
//    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    ViewController *homeVc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:homeVc];
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];
    
}

@end
