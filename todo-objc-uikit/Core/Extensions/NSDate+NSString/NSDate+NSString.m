//
//  NSDate+NSString.m
//  todo-objc-uikit
//
//  Created by Ademola Fadumo on 14/07/2024.
//

#import "NSDate+NSString.h"

@implementation NSDate (FormattedDate)

- (NSString *)formattedDate {
    // Create and configure the NSDateFormatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    // Set the date format
    [dateFormatter setDateFormat:@"ha EEE"]; // 9PM Tue 2

    // Convert date to string
    NSString *formattedDateString = [dateFormatter stringFromDate:self];

    // Get the day component to add the correct suffix
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:self];
    NSInteger day = [components day];
    // NSString *dayWithSuffix = [self daySuffixForDay:day];

    // Append the year to the formatted string
    [dateFormatter setDateFormat:@""];
    NSString *yearString = [dateFormatter stringFromDate:self];

    // Combine everything
    formattedDateString = [NSString stringWithFormat:@"%@%@", formattedDateString, yearString];

    return formattedDateString;
}

- (NSString *)daySuffixForDay:(NSInteger)day {
    NSString *suffix;
    if (day % 10 == 1 && day != 11) {
        suffix = @"st";
    } else if (day % 10 == 2 && day != 12) {
        suffix = @"nd";
    } else if (day % 10 == 3 && day != 13) {
        suffix = @"rd";
    } else {
        suffix = @"th";
    }
    return suffix;
}

@end
