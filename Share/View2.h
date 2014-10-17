//
//  View2.h
//  Share
//
//  Created by Hansel Itz on 15/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View2 : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *teamPicker;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput2;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput3;
- (IBAction)btnSharePressed:(id)sender;

@end
