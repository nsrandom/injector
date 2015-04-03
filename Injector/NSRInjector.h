#import <Foundation/Foundation.h>

#import "NSRMacros.h"

@class NSRInjectorOptions;

@interface NSRInjector : NSObject

/** Retrieve the shared singleton injector. */
+ (instancetype)sharedInstance;

- (void)bindImplClass:(Class)implClass
            toService:(Protocol *)serviceProtocol
          withOptions:(NSRInjectorOptions *)injectorOptions;

- (id)inject:(Protocol *)serviceProtocol;

@end
