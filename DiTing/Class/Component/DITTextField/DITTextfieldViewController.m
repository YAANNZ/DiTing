//
//  DITTextfieldViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/7/5.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITTextfieldViewController.h"

@interface DITTextfieldViewController ()

@property (nonatomic, strong) UITextField *firstTextField;
@property (nonatomic, strong) UITextField *secondTextField;

@end

@implementation DITTextfieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.firstTextField = [[UITextField alloc] init];
    self.firstTextField.text = @"测试文字";
    self.firstTextField.font = [UIFont systemFontOfSize:15];
    self.firstTextField.textAlignment = NSTextAlignmentCenter;
    self.firstTextField.backgroundColor = [UIColor whiteColor];
    self.firstTextField.layer.borderColor = [UIColor blackColor].CGColor;
    self.firstTextField.layer.borderWidth = 1.0;
    [self.view addSubview:self.firstTextField];
    
    [self.firstTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@250);
        make.height.equalTo(@30);
        make.top.equalTo(@100);
        make.centerX.equalTo(@0);
    }];
    
    
    
    self.secondTextField = [[UITextField alloc] init];
    self.secondTextField.defaultText = @"测试文字";
    self.secondTextField.font = [UIFont systemFontOfSize:15];
    self.secondTextField.textAlignment = NSTextAlignmentCenter;
    self.secondTextField.backgroundColor = [UIColor whiteColor];
    self.secondTextField.layer.borderColor = [UIColor blackColor].CGColor;
    self.secondTextField.layer.borderWidth = 1.0;
    [self.view addSubview:self.secondTextField];
    
    [self.secondTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@250);
        make.height.equalTo(@30);
        make.top.equalTo(self.firstTextField.mas_bottom).offset(100);
        make.centerX.equalTo(@0);
    }];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.firstTextField becomeFirstResponder];
    UITextRange *range = [self.firstTextField textRangeFromPosition:self.firstTextField.beginningOfDocument toPosition:self.firstTextField.endOfDocument];
    [self.firstTextField setSelectedTextRange:range];
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
