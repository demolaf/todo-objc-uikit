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
    [dateFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm:ss"]; // Adjust format as needed

    // Convert date to string
    NSString *formattedDateString = [dateFormatter stringFromDate:self];

    return formattedDateString;
}

@end
