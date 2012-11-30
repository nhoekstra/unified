//
//  enableDisableData.m
//  UniFied
//
//  Created by Narbeh Shahnazarian on 11/30/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import "enableDisableData.h"

@implementation enableDisableData
@synthesize isDoneMakingPost;
static enableDisableData *instance =nil;
+(enableDisableData *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [enableDisableData new];
        }
    }
    return instance;
}
@end
