//
//  BNRHynosisViewController.m
//  HypnoNerd
//
//  Created by Dane on 8/18/15.
//  Copyright (c) 2015 Regnier Design. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@property (nonatomic, weak) UITextField *textField;

@end

@implementation BNRHypnosisViewController

- (void)loadView
{
    // Create the view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // Setting up frame for text field, then making said text field
    CGRect textFieldRect = CGRectMake(65, 100, 245, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Setting up the border style for the text field
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    // Setting the delegate for the text field
    textField.delegate = self;
    
    
    [backgroundView addSubview:textField];
    
    // setting as view for the view controller
    self.textField = textField;
    self.view = backgroundView;
}

// Overriding initWithNibName:bundle:
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Setting the tab bar's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Creating the UIImage from file
        // Will use the @2x on retina devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Throw it in the tab bar
        self.tabBarItem.image = i;
    }
    return self;
}

// Overriding viewDidLoad to add a log
- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
//    NSLog(@"BNRHypnosisViewController loaded its view");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
         usingSpringWithDamping:0.25
          initialSpringVelocity:0.0
                        options:0 
                     animations:^{
                         CGRect frame = CGRectMake(65, 100, 240, 30);
                         self.textField.frame = frame;
                     }
                     completion:NULL];
}

// Implementing textFieldShouldReturn for the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Commenting out to implement super spooky messages
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

// Setting up our super spooky hypnotic message!
- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 10; i++) {
        
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // Setting up the colors/text for the labels
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        
        // Resizing the label
        [messageLabel sizeToFit];
        
        // Grabbing random x value that fits in the view
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // Random y value to go with that
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // Updating the frame for the label
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Adding the label into the hierarchy
        [self.view addSubview:messageLabel];
        
        // Set original alpha
        messageLabel.alpha = 0.0;
        
        // Animate alpha to 1.0
        [UIView animateWithDuration:0.5 
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseIn 
                         animations:^{
                             messageLabel.alpha = 1.0;
                         }
                          completion:NULL];
        
        // Setting up Keyframe animations
        [UIView animateKeyframesWithDuration:1.0
                                       delay:0.0
                                     options:0
                                  animations:^{
    [UIView addKeyframeWithRelativeStartTime:0.0 
                            relativeDuration:0.8 
                                  animations:^{
                                      messageLabel.center = self.view.center;
                                  }];
                                      
    [UIView addKeyframeWithRelativeStartTime:0.8
                            relativeDuration:0.2
                                  animations:^{
                                      int x = arc4random() % width;
                                      int y = arc4random() % height;
                                      messageLabel.center = CGPointMake(x, y);
                                            }];
                                  }
                                  completion:^(BOOL finished){
                                      NSLog(@"Animation Finished");
                                  }];
                         
        
        // Horizontal parallax effect
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        // Vertical parallax effect
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
    }
}

@end

















