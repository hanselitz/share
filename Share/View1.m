//
//  View1.m
//  Share
//
//  Created by Hansel Itz on 15/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import "View1.h"
#import "cellWelcome.h"

@interface View1 ()

@end

@implementation View1

NSMutableArray *maNames;
NSMutableArray *maLastNames;
NSMutableArray *maImages;


NSString        *strSelectedName;
NSString        *strSelectedImg;
NSString        *strSelectedLastNames;
NSString        *complete;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    maNames     =  [NSMutableArray arrayWithObjects: @"Víctor", @"Eduardo", @"Guillermo", @"Sergio", @"Alfredo", @"Deimar", @"Wilder", @"Juan", @"Rafael", @"Lucio", nil];
    maLastNames     =  [NSMutableArray arrayWithObjects: @"Jímenez", @"Juarez", @"Madrazo", @"Wade", @"López", @"Hernández", @"Camacho", @"Cano", @"Trujillo", @"Yedra", nil];
    maImages    =  [NSMutableArray arrayWithObjects: @"snoop1.jpg", @"snoop2.jpg", @"snoop3.jpg", @"snoop4.jpg", @"snoop6.jpg", @"snoop5.jpeg", @"ai1.jpeg", @"ai2.jpeg", @"ai3.jpg", @"ai4.jpg", nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellFamily");
    static NSString *CellIdentifier = @"cellWelcome";
    
    cellWelcome *cell = (cellWelcome *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[cellWelcome alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.lblName.text       = maNames[indexPath.row];
    cell.lblLastName.text   = maLastNames[indexPath.row];
    cell.imgPeople.image    = [UIImage imageNamed:maImages[indexPath.row]];
    
    return cell;
}

//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    strSelectedName     = [NSString stringWithFormat:@"%@", maNames[indexPath.row]];
    strSelectedLastNames = [NSString stringWithFormat:@"%@", maLastNames[indexPath.row]];
   
   complete = [NSString stringWithFormat:@"%@ %@",strSelectedName,  strSelectedLastNames];
    
    strSelectedImg      = [NSString stringWithFormat:@"%@", maImages[indexPath.row]];
    
    
}


- (IBAction)btnSharePressed:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    for(int i = 1; i < 10; i++) {
    
        NSString *name = [NSString stringWithFormat:maNames, i];
    
    }
    
    strShareMsg = @"Snoop";
    imgShare    = [UIImage imageNamed:@"snoop1.jpg"];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}

- (IBAction)btnShareCell:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = complete; 
    imgShare    = [UIImage imageNamed:strSelectedImg];
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}
@end
