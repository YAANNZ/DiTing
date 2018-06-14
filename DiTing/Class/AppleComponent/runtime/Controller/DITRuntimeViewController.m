//
//  DITRuntimeViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/12.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITRuntimeViewController.h"
#import "DITForwardingTest.h"
#import "UITextView+DITPlaceholder.h"
#import "NSObject+DITKeyValues.h"

@interface DITRuntimeViewController ()

@end

@implementation DITRuntimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1. 方法交换
    [self testMethod_exchangeImplementations];
    
    // 2. 动态添加方法(动态方法解析)
    [self testDynamicMethod];
    
    // 3. 备用接受者
    [self testForwardingReceiver];
    
    // 4. 完整消息转发
    [self testMethodSignature];
    
    // 5. 动态添加属性
    [self testDynamicProperty];
    
    // 6. 字典转模型
    [self testModelWithDict];
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
    [self performSelector:@selector(justTestMethodSignature:) withObject:@"testMethodSignatureStr"];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(justTestMethodSignature:))
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL sel = anInvocation.selector;
    DITForwardingTest *methodSignatureTest = [[DITForwardingTest alloc] init];
    
    if ([methodSignatureTest respondsToSelector:sel])
    {
        [anInvocation invokeWithTarget:methodSignatureTest];
    }
    else
    {
        [anInvocation doesNotRecognizeSelector:sel];
//        [super forwardInvocation:anInvocation];
    }
}

//- (void)forwardInvocation:(NSInvocation *)anInvocation
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//- (id)forwardingTargetForSelector:(SEL)aSelector
//+ (BOOL)resolveClassMethod:(SEL)sel
//+(BOOL)resolveInstanceMethod:(SEL)sel



#pragma mark - 动态添加属性
- (void)testDynamicProperty
{
    UITextView *testTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, MAINSCREEN_WIDTH-20, 200)];
    testTextView.layer.borderWidth = 1.0;
    testTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    testTextView.font = [UIFont systemFontOfSize:15];
    testTextView.placeholder = @"I'm a placeholder!";
    [self.view addSubview:testTextView];
}


#pragma mark - 字典转模型
- (void)testModelWithDict
{
    DITForwardingTest *forwardingTestModel = [DITForwardingTest modelWithKeyValues:@{
                                            @"testName": @"testName123",
                                            @"subModel": @{@"testSubName": @"testSubName123"}
                                            }];
    NSLog(@"%@", forwardingTestModel.mj_keyValues);
}




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
