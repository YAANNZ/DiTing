//
//  DITRuntimeViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/12.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITRuntimeViewController.h"
#import "DITForwardingTest.h"

@interface DITRuntimeViewController ()

@end

@implementation DITRuntimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1. 方法交换
    [self testMethod_exchangeImplementations];
    
    // 2. 动态添加方法
    [self testDynamicMethod];
    
    // 3. 备用接受者
    [self testForwardingReceiver];
    
    // 4. 完整消息转发
    [self testMethodSignature];
}

#pragma mark - 方法交换
- (void)testMethod_exchangeImplementations
{
    UIImage *testImage = [UIImage imageNamed:@"xxx"];
    NSLog(@"%@", testImage);
}


#pragma mark - 动态添加方法
- (void)testDynamicMethod
{
    [self performSelector:@selector(justTest:) withObject:@"testStr"];
//    [DITRuntimeViewController performSelector:@selector(justClassTest:) withObject:@"classTestStr"];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(justTest:))
    {
        class_addMethod([self class], sel, (IMP)justTestMethod, "v@:@");
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

void justTestMethod(id self, SEL _cmd, id str) {
    NSLog(@"%@的%@方法动态实现了，参数为：%@", self, NSStringFromSelector(_cmd), str);
}


#pragma mark - 备用接受者
- (void)testForwardingReceiver
{
    [self performSelector:@selector(justTestForwarding:) withObject:@"testStr"];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(justTestForwarding:))
    {
        return [[DITForwardingTest alloc] init];
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 完整消息转发
- (void)testMethodSignature
{
    
}

//- (void)forwardInvocation:(NSInvocation *)anInvocation
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//- (id)forwardingTargetForSelector:(SEL)aSelector
//+ (BOOL)resolveClassMethod:(SEL)sel
//+(BOOL)resolveInstanceMethod:(SEL)sel




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
