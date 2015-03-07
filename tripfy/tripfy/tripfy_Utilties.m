//
//  tripfy_Utilties.m
//  tripfy
//
//  Created by eser on 28/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_Utilties.h"


@implementation tripfy_Utilties

- (id) init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (BOOL) stringCheck:(NSString *) string {
    if(string != nil && ![string isKindOfClass:[NSNull class]] && ![[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]){
        return YES;
    }
    
    return NO;
}

- (UIImage *) maskImage:(UIImage *) image withMask:(UIImage *) mask
{
    CGImageRef imageReference = image.CGImage;
    CGImageRef maskReference = mask.CGImage;
    
    CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
                                             CGImageGetHeight(maskReference),
                                             CGImageGetBitsPerComponent(maskReference),
                                             CGImageGetBitsPerPixel(maskReference),
                                             CGImageGetBytesPerRow(maskReference),
                                             CGImageGetDataProvider(maskReference),
                                             NULL, // Decode is null
                                             YES // Should interpolate
                                             );
    
    CGImageRef maskedReference = CGImageCreateWithMask(imageReference, imageMask);
    CGImageRelease(imageMask);
    
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedReference];
    CGImageRelease(maskedReference);
    
    return maskedImage;
}

@end
