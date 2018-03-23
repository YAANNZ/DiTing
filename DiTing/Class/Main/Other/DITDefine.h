//
//  DITDefine.h
//  DiTing
//
//  Created by ZHUYN on 2017/8/17.
//  Copyright © 2017年 zyn. All rights reserved.
//

#ifndef DITDefine_h
#define DITDefine_h


#endif /* DITDefine_h */

/*
 baseColor
 */
#define WeChat_Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

#define DITColor(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

#define WeChat_Global_mainColor DITColor(248, 248, 248, 1)


// MBProgressHUD
#define ShowMBProgressHUDText(Text)     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];\
hud.mode = MBProgressHUDModeText;\
hud.label.text = Text;\
[hud hideAnimated:YES afterDelay:0.8];

#define ShowMBProgressHUDInViewText(Text)     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];\
hud.mode = MBProgressHUDModeText;\
hud.label.text = Text;\
[hud hideAnimated:YES afterDelay:0.8];


/*
 common
 */
//设备屏幕大小
#define MAINSCREEN_FRAME   [[UIScreen mainScreen] bounds]
//设备屏幕宽
#define MAINSCREEN_WIDTH  MAINSCREEN_FRAME.size.width
//设备屏幕高
#define MAINSCREEN_HEIGHT MAINSCREEN_FRAME.size.height
//导航栏高
#define NAV_HEIGHT 64
//Tabbar高
#define TABBAR_HEIGHT 49
