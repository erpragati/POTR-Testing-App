//
//  PCRootViewController.h
//  POTR SDK Test App
//
//  Created by Marc Charbonneau on 10/20/11.
//  Copyright (c) 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCWorkflowController.h"

@interface PCRootViewController : UIViewController <PCWorkflowControllerDelegate, UINavigationControllerDelegate>
{
    UIImageView *_imageView;
}

@property(retain, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)beginModal:(id)sender;
- (IBAction)beginNonModal:(id)sender;

@end
