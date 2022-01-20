#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(WatchToIos, NSObject)

RCT_EXTERN_METHOD(sendMessageData:(NSData *)data)
RCT_EXTERN_METHOD(sendMessage:(NSDictionary *)data)

@end




