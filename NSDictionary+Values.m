//
//  NSDictionary+Values.m
//
//  Created by Danilo Priore on 23/05/14.
//
//	http://www.prioregroup.com/iphone/developer/article.aspx?85

#import "NSDictionary+Values.h"

@implementation NSDictionary (Values)

- (id)valueForKeyPath:(NSString *)keyPath
{
    __block id value = nil;
    
    if (keyPath != nil) {
        NSArray *keys = [keyPath componentsSeparatedByString:@"."];
        if (keys && [keys count] > 0) {
            [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                value = idx == 0 ? [self objectForKey:obj] : [value objectForKey:obj];
                if (value == nil || ![value isKindOfClass:[NSDictionary class]])
                    *stop = YES;
            }];
        }
    }
    
    return value;
}

@end
