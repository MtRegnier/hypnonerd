//
//  BNRViewController.m
//  Quiz
//
//  Created by Dane on 8/16/15.
//  Copyright (c) 2015 Regnier Design. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic) NSArray *questions;
@property (nonatomic) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Calling in the super init method
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Setting up two arrays for questions and answers
        // Maybe some pointers, I'm feeling frisky
        
        self.questions = @[@"From what is congac made?", @"What is 7 + 7?", @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes", @"14", @"Montpelier"];
        
        self.tabBarItem.title = @"Quiz";
        
    }
    
    return self;
    
}

- (IBAction)showQuestion:(id)sender
{
    // Stepping up to the current question
    self.currentQuestionIndex++;
    
    // Is this the end?
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    // Grabbing the string at provided index
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Changing up the UILabel to show the question
    self.questionLabel.text = question;
    
    // Reset the answer label
    // No cheating!
    self.answerLabel.text = @"???";
    
    
}
- (IBAction)showAnswer:(id)sender
{
    // Let's take a look for that answer
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Showing it off in the answer label
    self.answerLabel.text = answer;
    
}


@end
