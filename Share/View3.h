//
//  View3.h
//  Share
//
//  Created by Hansel Itz on 15/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View3 : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)datePicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput2;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker2;

- (IBAction)datePicked2:(id)sender;

- (IBAction)btnSeePressed:(id)sender;
- (IBAction)btnSharePressed:(id)sender;


@end
