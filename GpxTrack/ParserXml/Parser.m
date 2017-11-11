//
//  Parser.m
//  GpxTrack
//
//  Created by Paweł Trojan on 13.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import "Parser.h"

@implementation Parser

static Parser *_sharedInstance = nil;
static dispatch_once_t once_token = 0;

+ (instancetype)sharedInstance {
    dispatch_once(&once_token, ^{
        if (_sharedInstance == nil) {
            _sharedInstance = [[Parser alloc] init];
        }
    });
    return _sharedInstance;
}

+ (void)setSharedInstance:(Parser *)instance {
    // resets the once_token so dispatch_once will run again
    once_token = 0;
    _sharedInstance = instance;
}

- (void)parseDataToDataBase {
    
}

@end
