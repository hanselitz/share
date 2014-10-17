//
//  ViewPicker.h
//  Share
//
//  Created by Hansel Itz on 16/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPicker : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput2;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput3;

@property (weak, nonatomic) IBOutlet UIImageView *imgAero;

- (IBAction)btnSharePressed:(id)sender;
- (IBAction)btnSeePressed:(id)sender;

@end
