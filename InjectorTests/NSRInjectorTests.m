#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NSRInjector.h"

#pragma mark - Test API + implementation

@protocol TestService <NSObject>
@end

@interface TestImpl : NSObject <TestService>
@end

@implementation TestImpl
@end

#pragma mark - NSRInjectorTests

@interface NSRInjectorTests : XCTestCase
@end

@implementation NSRInjectorTests

- (void)setUp {
  [super setUp];
  NSR_BIND(TestImpl, TestService, nil);
}

- (void)tearDown {
  [super tearDown];
}

- (void)testExample {
  id injectedObject = NSR_INJECT(TestService);
  XCTAssert([injectedObject conformsToProtocol:@protocol(TestService)],
            @"|injectedObject| should conform to TestService protocol");
}

//- (void)testPerformanceExample {
//  // This is an example of a performance test case.
//  [self measureBlock:^{
//      // Put the code you want to measure the time of here.
//  }];
//}

@end
