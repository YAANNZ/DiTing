//
//  DITSearchBar.m
//  DiTing
//
//  Created by yanan.zhu on 2023/1/31.
//  Copyright © 2023 zyn. All rights reserved.
//

#import "DITSearchBar.h"

@implementation DITSearchBar


- (void)buildSearchView {
    self.view.backgroundColor = RRContentBackgroundColor191919;
    
    self.searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0, topMargin, SCREEN_WIDTH, 44)];
    self.searchBarView.backgroundColor = RRContentBackgroundColor191919;;
    
    self.cancelLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 15 - 46, 10, 46, 20)];
    self.cancelLabel.text = @"Cancel";
    self.cancelLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.cancelLabel.textColor = UIDynamicColorWithRGBAValue(RRThemeColorHex, 0, 0xffffff, 0);
    self.cancelLabel.textAlignment = NSTextAlignmentRight;
    [self.searchBarView addSubview:self.cancelLabel];
    UITapGestureRecognizer *cancelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelSearchActive)];
    [self.cancelLabel addGestureRecognizer:cancelTap];
    self.cancelLabel.userInteractionEnabled = YES;
    
    self.searchTextFieldView = [[UIView alloc] initWithFrame:CGRectMake(15, 3, self.cancelLabel.left - 10 - 15, 34)];
    self.searchTextFieldView.backgroundColor = UIDynamicColorWithRGBAValue(0xF1F1F1, 0, 0x252525, 0);
    self.searchTextFieldView.layer.cornerRadius = 5.0;
    self.searchTextFieldView.clipsToBounds = YES;
    self.searchTextFieldView.layer.masksToBounds = YES;
    
    UIImage *searchIcon = [UIImage imageNamed:@"filter_group_search"];
    self.searchIconImageView = [[UIImageView alloc] initWithImage:searchIcon];
    self.searchIconImageView.frame = CGRectMake(10, 10, 14, 14);
    [self.searchTextFieldView addSubview:self.searchIconImageView];
    
    self.searchBarTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.searchIconImageView.right + 8, 0, self.cancelLabel.left - 15 - 10 - (self.searchIconImageView.right + 8), 34)];
    self.searchBarTextField.placeholder = @"Search";
    self.searchBarTextField.backgroundColor = RRClearColor;
    self.searchBarTextField.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    self.searchBarTextField.textColor = UIDynamicColorWithRGBValue(0x515666, 0xffffff);
    self.searchBarTextField.textAlignment = NSTextAlignmentLeft;
    [self.searchBarTextField becomeFirstResponder];
    self.searchBarTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchBarTextField.delegate = self;
    self.searchBarTextField.tintColor = RRThemeColor;
    self.searchBarTextField.returnKeyType = UIReturnKeySearch;
    self.searchBarTextField.enablesReturnKeyAutomatically = YES;//Set no input, search click on the keyboard
    self.searchBarTextField.autocorrectionType = UITextAutocorrectionTypeNo;//Remove the lenovo match
    self.searchBarTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;//Remove the first input uppercase by default
    [self.searchTextFieldView addSubview:self.searchBarTextField];
    [self.searchBarView addSubview:self.searchTextFieldView];
    
    [[self.searchBarTextField valueForKey:@"_clearButton"] setImage:[UIImage imageNamed:@"search_clear_icon"] forState:UIControlStateNormal];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = UIDynamicColorWithRGBAValue(0xF0F2F8, 1, 0xF0F2F8, 0.05);
    [self.searchBarView addSubview:lineView];
    [self.view addSubview:self.searchBarView];
    
    self.searchBarView.frame = CGRectMake(SCREEN_WIDTH, topMargin, 0, 44);
    //searchBarView up animation
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        [weakSelf initNavigationBarHidden];
        weakSelf.searchBarView.frame = CGRectMake(0, topMargin, SCREEN_WIDTH, 44);
        weakSelf.cancelLabel.textColor = UIDynamicColorWithRGBAValue(RRThemeColorHex, 1, 0xffffff, 1);
        self.searchTextFieldView.backgroundColor = UIDynamicColorWithRGBAValue(0xF1F1F1, 1, 0x252525, 1);
        weakSelf.currentSelectedScrollView.hidden = YES;
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
}

@end
