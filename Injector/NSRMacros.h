#ifndef Injector_NSRMacros_h
#define Injector_NSRMacros_h

#define NSR_BIND(_implClass_, _serviceProtocol_, _injectorOptions_) \
  [[NSRInjector sharedInstance] bindImplClass:[_implClass_ class] \
                                    toService:@protocol(_serviceProtocol_) \
                                  withOptions:_injectorOptions_]

#define NSR_INJECT(_serviceProtocol_) \
  [[NSRInjector sharedInstance] inject:@protocol(_serviceProtocol_)]

#endif
