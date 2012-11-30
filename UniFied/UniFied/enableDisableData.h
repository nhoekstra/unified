//
//  enableDisableData.h
//  UniFied
//
//  Created by Narbeh Shahnazarian on 11/30/12.
//  Copyright (c) 2012 Renegades. All rights reserved.
//

#import <Foundation/Foundation.h>

//the class has only the purpose of updating the isDonMakingPost variable wfrom which every class it is called from.
@interface enableDisableData : NSObject
{
    BOOL isDoneMakingPost;
}

@property BOOL isDoneMakingPost;

//method to handle the update
+(enableDisableData*)getInstance;

@end
