//
//  ViewController.m
//  Quotes
//
//  Created by Alexander Valero on 9/9/15.
//  Copyright (c) 2015 Alexander Valero. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *quoteText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *quoteOpt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self initRandomQuotes];
    [self initMovieQuotes];
    
    
    
    
}

- (void) initRandomQuotes
{
    
    self.quoteText.text = @"";

//    self.myQuotes = @[@"Frankly my dear, I don't give a dam",
//                          @"Here's looking at you kid",
//                          @"There's no place like home",
//                          @"Play it again sam",
//                          @"Elementary my dear Watson",
//                          @"Fasten your seatbelts. It's going to be a bumpy night",
//                          @"All about Eve",
//                          @"I have not the pleasure of understanding you",
//                          @"Romeo, Romeo! wherefore art thouRomeo?",
//                          @"To be or not to be",
//                          @"That's, uh, quite a dress you almost have on...What holds it up?",
//                          @"Love, desire, ambition, faith - without them life is so simple, believe me",
//                          @"Go ahead make my day"];
}

- (IBAction)quoteButtonTapped:(id)sender
{
    //Filtering
    NSInteger selectedOpt = self.quoteOpt.selectedSegmentIndex;
    
    NSString *category;
    
    switch (selectedOpt) {
        case 0:
            category = @"classic";
            break;
        case 1:
            category = @"modern";
            break;
        default:
            category = @"mine";
            break;
    }
    
    NSMutableArray *filteredQuotes = [[NSMutableArray alloc]init];
    
    for (NSDictionary *quote in self.movieQuotes) {
        if ([quote[@"category"] isEqualToString:category])
        {
            [filteredQuotes addObject:quote];
        }
    }
    //
    
    NSUInteger filteredQuotesTotal = [filteredQuotes count];
    
    NSUInteger randomIndex = arc4random_uniform((int)filteredQuotesTotal);
    
    if ([filteredQuotes count] > randomIndex)
    {
        NSDictionary *randomQuote = filteredQuotes[randomIndex];
        
        self.quoteText.text = randomQuote[@"quote"];
        
        NSLog(@"%@", self.quoteText.text);
    }
    else
    {
        self.quoteText.text = @"QUOTE NOT FOUND!";
        
        NSLog(@"%@", self.quoteText.text);
    }
    
    
}

- (void) initMovieQuotes
{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistPath];
    NSLog(@"%@", self.movieQuotes);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
