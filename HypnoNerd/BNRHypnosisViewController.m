//
//  BNRHynosisViewController.m
//  HypnoNerd
//
//  Created by Dane on 8/18/15.
//  Copyright (c) 2015 Regnier Design. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (void)loadView
{
    // Create the view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // setting as view for the view controller
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
    
    // Setting up the segmented control
    CGRect segContBounds = CGRectMake(75.0, 470.0, 225.0, 30.0);
    NSArray *colorOptions = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *colorPicker = [[UISegmentedControl alloc] initWithItems:colorOptions];
    [colorPicker setFrame:segContBounds];

    colorPicker.tintColor = [UIColor darkGrayColor];
    
    [colorPicker addTarget:self.view action:@selector(chooseCircleColor:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:colorPicker];
    
    NSLog(@"BNRHypnosisViewController loaded its view");
}





@end
