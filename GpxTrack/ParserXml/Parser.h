//
//  Parser.h
//  GpxTrack
//
//  Created by Paweł Trojan on 13.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject
+ (instancetype)sharedInstance;
+ (void)setSharedInstance:(Parser *)instance;

- (void)parseDataToDataBase;
@end
