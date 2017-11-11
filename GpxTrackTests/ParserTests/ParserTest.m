//
//  ParserTest.m
//  GpxTrackTests
//
//  Created by Paweł Trojan on 13.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Parser.h"
#import <OCMock/OCMock.h>


@interface ParserTest : XCTestCase

@end

@implementation ParserTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
    [Parser setSharedInstance: nil];
}

- (void)testIfParserIsSingleton_ShouldReturnOndeInstance {
    Parser *parserFirst = Parser.sharedInstance;
    Parser *parserSecond = Parser.sharedInstance;
    XCTAssertEqual(parserFirst, parserSecond);
}

- (void)testCallParseDataToDataBase {
    Parser *parser = Parser.sharedInstance;
    id parserMock = OCMPartialMock(parser);
    [parserMock parseDataToDataBase];
    OCMVerify([parserMock parseDataToDataBase]);
}


@end
