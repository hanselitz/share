//
//  ViewPicker.m
//  Share
//
//  Created by Hansel Itz on 16/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import "ViewPicker.h"

@interface ViewPicker ()

@end

@implementation ViewPicker

NSArray *dataArray;
NSArray *dataArray1;
NSArray *dataArray2;


NSString *trip1;
NSString *trip2;
NSString *trip3;
NSString *strSelectedImg;
NSString  *complete;

- (void)viewDidLoad
{
    
    dataArray = [[NSArray alloc] initWithObjects:@"Viva Aerobus", @"Aeromexico", @"Interjet", @"Volaris", @"Aeromar", nil];
    //dataArray1 = [[NSArray alloc] initWithObjects:@"Guadalajara", @"Zapopan", @"Vallarta", nil];
    //dataArray2 = [[NSArray alloc] initWithObjects:@"Villahermosa", @"Cardenas", @"Paraiso", nil];
    _picker.delegate = self ;
    _picker.dataSource = self ;
    
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
            trip1 = [dataArray objectAtIndex:row];
            
            if( [trip1 isEqual: @"Viva Aerobus"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Guadalajara", @"Zapopan", @"Vallarta", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Orizaba", @"Xalapa", @"Veracruz", nil];
                strSelectedImg = @"viva.png";
            } if( [trip1  isEqual: @"Aeromexico"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Villahermosa", @"Cardenas", @"Paraiso", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Mérida", @"Valladolid", @"Progreso", nil];
                strSelectedImg = @"aeromexico.jpg";
            } if( [trip1  isEqual: @"Interjet"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Tuxtla", @"San Cristobal", @"Palenque", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Toluca", @"Queretaro", @"Zacatecas", nil];
                strSelectedImg = @"interjet.png";
            } if( [trip1  isEqual: @"Volaris"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Tijuana", @"Ensenada", @"Los Cabos", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Monterrey", @"Guadalupe", @"Apodaca", nil];
                strSelectedImg = @"volaris.png";
            } if( [trip1 isEqual: @"Aeromar"]) {
                
                dataArray1 = [[NSArray alloc] initWithObjects:@"Cancún", @"Playa del Carmen", @"Tulum", nil];
                dataArray2 = [[NSArray alloc] initWithObjects:@"Campeche", @"Ciudad del Carmen", @"Isla Aguada", nil];
                strSelectedImg = @"aeromar.jpg";
            }
    
            [self.picker reloadAllComponents];
            
            break;
        case 1:
            trip2 = [dataArray1 objectAtIndex:row];            break;
        case 2:
            trip3 = [dataArray2 objectAtIndex:row];            break;
    }
    
  
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


- (IBAction)btnSharePressed:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    
    
    strShareMsg = complete;
    imgShare    = [UIImage imageNamed:strSelectedImg];
    aShareItems = @[strShareMsg,imgShare];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}

- (IBAction)btnSeePressed:(id)sender {
    
    _lblOutput.text = trip1;
    _lblOutput2.text = trip2;
    _lblOutput3.text = trip3;
    _imgAero.image = [UIImage imageNamed:strSelectedImg];
    
    complete = [NSString stringWithFormat:@"Usted viajará por %@ de %@ hacia %@",_lblOutput.text,  _lblOutput2.text, _lblOutput3.text];
}
@end