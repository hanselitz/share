//
//  View1.h
//  Share
//
//  Created by Hansel Itz on 15/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View1 : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblMain;


- (IBAction)btnSharePressed:(id)sender;

- (IBAction)btnShareCell:(id)sender;

@end
