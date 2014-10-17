//
//  View2.m
//  Share
//
//  Created by Hansel Itz on 15/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import "View2.h"

@interface View2 ()

@end

@implementation View2

NSArray *dataArray;
NSArray *dataArray1;
NSArray *dataArray2;

NSString *strSelectedImg;
NSString  *complete;

- (void)viewDidLoad
{
    dataArray = [[NSArray alloc] initWithObjects:@"Viva Aerobus", @"Aeromexico", @"Interjet", @"Volaris", @"Aeromar", nil];
    dataArray1 = [[NSArray alloc] initWithObjects:@"Guadalajara", @"Zapopan", @"Vallarta", nil];
    dataArray2 = [[NSArray alloc] initWithObjects:@"Villahermosa", @"Cardenas", @"Paraiso", nil];
    //_teamPicker.delegate = self ;
    //_teamPicker.dataSource = self ;
    
    [super viewDidLoad];
    
}

#pragma mark Picker Data Source Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    int numberOfRows = 0;
    switch (component) {
        case 0:
            numberOfRows = [dataArray count];
            break;
        case 1:
            numberOfRows = 3;
            break;
        case 2:
            numberOfRows = 3;
            break;
    }
    
    
    return numberOfRows;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (component) {
        case 0:
            _lblOutput.text = [dataArray objectAtIndex:row];
            
            if( [_lblOutput.text isEqual: @"Viva Aerobus"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Guadalajara", @"Zapopan", @"Vallarta", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Orizaba", @"Xalapa", @"Veracruz", nil];
                strSelectedImg = @"snoop1.jpg";
                //_image.image = [UIImage imageNamed:@"snoop1.jpg"];
                
            } if( [_lblOutput.text  isEqual: @"Aeromexico"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Villahermosa", @"Cardenas", @"Paraiso", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Mérida", @"Valladolid", @"Progreso", nil];
                strSelectedImg = @"snoop2.jpg";
                //_image.image = [UIImage imageNamed:@"snoop2.jpg"];
            } if( [_lblOutput.text  isEqual: @"Interjet"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Tuxtla", @"San Cristobal", @"Palenque", nil];
                 dataArray2 = [[NSArray alloc] initWithObjects:@"Toluca", @"Queretaro", @"Zacatecas", nil];

            } if( [_lblOutput.text  isEqual: @"Volaris"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Tijuana", @"Ensenada", @"Los Cabos", nil];
                 dataArray2 = [[NSArray alloc] initWithObjects:@"Monterrey", @"Guadalupe", @"Apodaca", nil];

            } if( [_lblOutput.text isEqual: @"Aeromar"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Cancún", @"Playa del Carmen", @"Tulum", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Campeche", @"Ciudad del Carmen", @"Isla Aguada", nil];

            }
            
            //NSLog(@"Data Array 1%@ ",dataArray1);
            [self.teamPicker reloadAllComponents];

            break;
        case 1:
            _lblOutput2.text = [dataArray1 objectAtIndex:row];            break;
        case 2:
            _lblOutput3.text = [dataArray2 objectAtIndex:row];            break;
    }
 
    complete = [NSString stringWithFormat:@"Usted viajará por %@ de %@ hacia %@",_lblOutput.text,  _lblOutput2.text, _lblOutput3.text];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {   
    
    NSString *title;
    switch (component) {
        case 0:
            title = [dataArray objectAtIndex:row];
            break;
        case 1:
            title = [dataArray1 objectAtIndex:row];
            break;
        case 2:
            title  = [dataArray2 objectAtIndex:row];
            break;
    }

    
    return title;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnSharePressed:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    
    
    strShareMsg = complete;
    imgShare    = [UIImage imageNamed:strSelectedImg];
    aShareItems = @[strShareMsg, imgShare];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}
@end


