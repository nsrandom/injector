#import "NSRInjector.h"

typedef id (^NSRBlock)();

@implementation NSRInjector {
  NSMutableDictionary *_singleBindings;  // <NSString(service), NSRBlock>
}

+ (instancetype)sharedInstance {
  static dispatch_once_t onceToken;
  static NSRInjector *sharedInjector;

  dispatch_once(&onceToken, ^{
    sharedInjector = [[NSRInjector alloc] init];
  });

  return sharedInjector;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _singleBindings = [NSMutableDictionary dictionary];
  }
  return self;
}

- (void)bindImplClass:(Class)implClass
            toService:(Protocol *)serviceProtocol
          withOptions:(NSRInjectorOptions *)injectorOptions {
  NSAssert(implClass, @"|implClass| cannot be nil");
  NSAssert(serviceProtocol, @"|serviceProtocol| cannot be nil");

  @synchronized(self) {
    NSRBlock block = [^() { return [[implClass alloc] init]; } copy];
    _singleBindings[NSStringFromProtocol(serviceProtocol)] = block;
  }
}

- (id)inject:(Protocol *)serviceProtocol {
  NSRBlock block;
  @synchronized(self) {
    block = _singleBindings[NSStringFromProtocol(serviceProtocol)];
  }
  return block ? block() : nil;
}

@end
