//
//  UITextView+RACSignalSupport.m
//  ReactiveObjC
//
//  Created by Cody Krieger on 5/18/12.
//  Copyright (c) 2012 Cody Krieger. All rights reserved.
//

#import "UITextView+RACSignalSupport.h"
#import <RACObjC/RACEXTScope.h>
#import <RACObjC/NSObject+RACDeallocating.h>
#import <RACObjC/NSObject+RACDescription.h>
#import <RACObjC/RACDelegateProxy.h>
#import <RACObjC/RACSignal+Operations.h>
#import <RACObjC/RACTuple.h>
#import <objc/runtime.h>

@implementation UITextView (RACSignalSupport)

static void RACUseDelegateProxy(UITextView *self) {
    if (self.delegate == self.rac_delegateProxy) return;

    self.rac_delegateProxy.rac_proxiedDelegate = self.delegate;
    self.delegate = (id)self.rac_delegateProxy;
}

- (RACDelegateProxy *)rac_delegateProxy {
	RACDelegateProxy *proxy = objc_getAssociatedObject(self, _cmd);
	if (proxy == nil) {
		proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(UITextViewDelegate)];
		objc_setAssociatedObject(self, _cmd, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}

	return proxy;
}

- (RACSignal *)rac_textSignal {
	@weakify(self);
	RACSignal *signal = [[[[[RACSignal
		defer:^{
			@strongify(self);
			return [RACSignal return:RACTuplePack(self)];
		}]
		concat:[self.rac_delegateProxy signalForSelector:@selector(textViewDidChange:)]]
		reduceEach:^(UITextView *x) {
			return x.text;
		}]
		takeUntil:self.rac_willDeallocSignal]
		setNameWithFormat:@"%@ -rac_textSignal", RACDescription(self)];

	RACUseDelegateProxy(self);

	return signal;
}

@end
