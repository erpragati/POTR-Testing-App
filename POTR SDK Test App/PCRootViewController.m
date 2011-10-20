//
//  PCRootViewController.m
//  POTR SDK Test App
//
//  Created by Marc Charbonneau on 10/20/11.
//  Copyright (c) 2011 ELC Technologies. All rights reserved.
//

#import "PCRootViewController.h"

@implementation PCRootViewController

#pragma mark API

@synthesize imageView = _imageView;

- (IBAction)beginModal:(id)sender;
{
    UIImage *image = self.imageView.image;
    PCWorkflowController *workflowController = [[PCWorkflowController alloc] initWithAPIKey:@"be7c371e881990ce085ef4e26c7eab93acda645"];
    
    workflowController.delegate = self;
    
    UIViewController *viewController = [workflowController modalViewControllerForPhoto:image];
    [self presentModalViewController:viewController animated:YES];
}

- (IBAction)beginNonModal:(id)sender;
{
    UIImage *image = self.imageView.image;
    PCWorkflowController *workflowController = [[PCWorkflowController alloc] initWithAPIKey:@"be7c371e881990ce085ef4e26c7eab93acda645"];
    
    workflowController.delegate = self;
    
    UIViewController *viewController = [workflowController viewControllerForPhoto:image];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self presentModalViewController:navController animated:YES];
    [navController release];
}

#pragma mark UIViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return ( interfaceOrientation == UIInterfaceOrientationPortrait );
}

- (void)viewDidUnload;
{
    [super viewDidUnload];
    self.imageView = nil;
}

#pragma mark NSObject

- (void)dealloc;
{
    [_imageView release];
    [super dealloc];
}

#pragma mark PCWorkflowControllerDelegate

- (BOOL)allowPhotoEditing;
{
    return YES;
}

- (BOOL)allowStatisticsGathering;
{
    return NO;
}

- (BOOL)useLocationServices;
{
    return YES;
}

- (BOOL)showCancelButton;
{
    return YES;
}
/*
- (UIColor *)tintColor;
{
    return [UIColor blackColor];
}
*/
- (NSString *)partnerName;
{
    return NSLocalizedString( @"Test App", @"" );
}

- (void)pcotr:(UIViewController *)pcotr canceled:(BOOL)canceled;
{
    NSLog( @"Done!" );
}

@end
