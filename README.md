# Injector
Injector provides a lightweight framework for binding and injecting services at runtime.

A "service" is composed of an API and an implementation of that API. There can be multiple implementations for a given API.

# Example
If you have an API
```objc
// HelloService.h
@protocol HelloService <NSObject>
- (void)sayHello;
@end
```

and an implementation for the above

```objc
// HelloNSLogger.h
@interface HelloNSLogger <HelloService>
@end

// HelloNSLogger.m
@implementation HelloNSLogger
- (void)sayHello {
  NSLog(@"Hello");
}
@end
```

Injector lets you bind the implementation to the service injector.
```objc
[[NSRInjector sharedInstance] bindImplClass:[HelloNSLogger class] 
                                  toService:@protocol(HelloService)
                                withOptions:[NSRInjectorOptions lazySingleton]];
                                
// Shortcut macro for the above
NSR_BIND(HelloNSLogger, HelloService, [NSRInjectorOptions lazySingleton]);
```

And then, a client of ```HelloService``` can obtain an instance of ```HelloService``` via
```objc
id<HelloService> helloService = [[NSRInjector sharedInstance] inject:@protocol(HelloService)];
// OR
id<HelloService> helloService = NSR_INJECT(HelloService);
```

