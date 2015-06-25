//
//  OutcomeViewController.m
//  Paypoint/Users/cliffeo/mobilesdk-demoapp-ios/Pods/PayPointPayments/PaypointSDK/PPOCustomField.m
//
//  Created by Robert Nash on 17/04/2015.
//  Copyright (c) 2015 Paypoint. All rights reserved.
//

#import "OutcomeViewController.h"
#import "ColourManager.h"
#import <PayPointPayments/Paypoint.h>

@interface OutcomeViewController ()
@property (nonatomic, strong) IBOutlet UILabel *tickLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *merchantRefLabel;
@property (weak, nonatomic) IBOutlet UILabel *transactionIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@end

@implementation OutcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Restart"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(restartButtonPressed:)];
    
    self.navigationItem.leftBarButtonItem.accessibilityLabel = @"RestartButton";
    
    self.tickLabel.text = @"\uF00C";
    self.tickLabel.textColor = [ColourManager ppYellow];
    
    self.cardNumberLabel.text = (self.outcome.maskedPan.length) ? self.outcome.maskedPan : @"";
    self.merchantRefLabel.text = (self.outcome.merchantRef) ?: @"";
    self.transactionIDLabel.text = (self.outcome.identifier) ?: @"";
    self.amountLabel.text = (self.outcome.amount.stringValue) ? [NSString stringWithFormat:@"£%.2f", self.outcome.amount.doubleValue] : @"";
}

- (void)restartButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
