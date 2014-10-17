//
//  View3.m
//  Share
//
//  Created by Hansel Itz on 15/10/14.
//  Copyright (c) 2014 hanselitz. All rights reserved.
//

#import "View3.h"

@interface View3 ()

@end

@implementation View3
int day, month, year, hour, minutes,seconds;
int day1, month1, year1, hour1, minutes1,seconds1;
int day2, month2, year2, hour2, minutes2,seconds2;
NSDateComponents *components, *components2;
NSDate *date1;
NSDate *date2;

NSDate *date;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)datePicked:(id)sender {
    
    NSTimeZone *sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT@"];
    NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];
    
    
    date1 = _datePicker.date;
    NSInteger sourceGMTOffSet = [sourceTimeZone secondsFromGMTForDate:date1];
    NSInteger destinationGMTOffSet = [destinationTimeZone secondsFromGMTForDate:date1];
    NSTimeInterval interval = destinationGMTOffSet - sourceGMTOffSet;
    
 
    
    NSDate *destinationDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:date1];
 
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit  |NSDayCalendarUnit| NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:destinationDate];
    day1 = [components day];
    month1 = [components month];
    year1 = [components year];
    hour1 = [components hour];
    minutes1 = [components minute];
    seconds1 = [components second];
    
    NSLog(@"La fecha es de %d años %d meses %d días con %d horas %d minutos %d segundos", year1, month1, day1, hour1, minutes1, seconds);
    
   /* NSLog (@"DESTINATIONDATE%@ ", destinationDate);
    NSLog (@"COMPONENTES%@ ", components);
    
    
    NSLog (@"chosenDate%@", date1);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateStyle:NSDateFormatterFullStyle];
    [dateFormat setTimeStyle:NSDateFormatterLongStyle];
   // _lblOutput.text = [dateFormat stringFromDate:chosenDate];
   // date1 = chosenDate;


   // NSString *formattedDateString = [dateFormat stringFromDate:date1];
    
   // NSLog(@"formattedDateString%@", formattedDateString); */

}
- (IBAction)datePicked2:(id)sender {
    
    NSTimeZone *sourceTimeZone2 = [NSTimeZone timeZoneWithAbbreviation:@"GMT@"];
    NSTimeZone *destinationTimeZone2 = [NSTimeZone systemTimeZone];
    
    
    date2 = _datePicker2.date;
    NSInteger sourceGMTOffSet2 = [sourceTimeZone2 secondsFromGMTForDate:date2];
    NSInteger destinationGMTOffSet2 = [destinationTimeZone2 secondsFromGMTForDate:date2];
    NSTimeInterval interval2 = destinationGMTOffSet2 - sourceGMTOffSet2;
    
    
    
    NSDate *destinationDate2 = [[NSDate alloc] initWithTimeInterval:interval2 sinceDate:date2];
    
    NSCalendar *calendar2 = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    components2 = [calendar2 components:(NSYearCalendarUnit | NSMonthCalendarUnit  |NSDayCalendarUnit| NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:destinationDate2];
    day2 = [components2 day];
    month2 = [components2 month];
    year2 = [components2 year];
    hour2 = [components2 hour];
    minutes2 = [components2 minute];
    seconds2 = [components2 second];
    
     NSLog(@"La fecha es de %d años %d meses %d días con %d horas %d minutos %d segundos", year2, month2, day2, hour2, minutes2, seconds2);
    
    /*date2 = _datePicker2.date;
    NSLog (@"chosenDate22%@", date2);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateStyle:NSDateFormatterFullStyle];
    [dateFormat setTimeStyle:NSDateFormatterLongStyle];
   // _lblOutput2.text = [dateFormat stringFromDate:chosenDate];
   // NSString *formattedDateString2 = [dateFormat stringFromDate:date2];
    
    
    //NSLog(@"formattedDateString2%@", formattedDateString2); */
}

- (IBAction)btnSeePressed:(id)sender {
    
    day = day2 - day1;
    month = month2 - month1;
    year =  year2 - year1;
    minutes = minutes2 - minutes1;
    hour = hour2 - hour1;
    seconds = seconds2 - seconds1;
    
    NSLog(@"La diferencia entre las 2 fechas es de %d años %d meses %d días con %d horas %d minutos %d segundos", year, month, day, hour, minutes, seconds);
    
   /* NSTimeInterval diff =[date2 timeIntervalSinceDate:date1];
    date = [NSDate dateWithTimeIntervalSinceReferenceDate:diff];
    NSLog(@"dateeee%@ ", date); */
    
   /* NSDate *chosenDate = date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateStyle:NSDateFormatterFullStyle];
    [dateFormat setTimeStyle:NSDateFormatterLongStyle];
    date2 = chosenDate;
    NSString *formattedDateString3 = [dateFormat stringFromDate:date2];
 */

    
    _lblOutput.text = [NSString stringWithFormat:@"La diferencia es de %d años %d meses %d días", year, month, day];
     _lblOutput2.text = [NSString stringWithFormat:@"con %d horas %d minutos %d segundos", hour, minutes, seconds];
}

- (IBAction)btnSharePressed:(id)sender {
    NSString                    *strShareMsg;
    UIImage                     *imgShare;
    NSArray                     *aShareItems;
    UIActivityViewController    *actViewController;
    
    
    strShareMsg =  [NSString stringWithFormat: @"La diferencia entre las 2 fechas es de %d años %d meses %d días con %d horas %d minutos %d segundos", year, month, day, hour, minutes, seconds];
    
    imgShare    = [UIImage imageNamed:@"clock.jpg"];
    aShareItems = @[strShareMsg, imgShare];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
    

}
@end
