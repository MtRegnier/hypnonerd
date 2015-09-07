//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Dane on 8/18/15.
//  Copyright (c) 2015 Regnier Design. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    // Adding a local notification
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:
     [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert)
                                       categories:nil]];
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Setting the tab bar's title
        self.tabBarItem.title = @"Reminder";
        
        // Creating the UIImage from file
        // Will use the @2x on retina devices
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        
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
    
//    NSLog(@"BNRReminderViewController loaded its view");
}

// Overriding viewWillAppear to prevent users setting dates in the past
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
