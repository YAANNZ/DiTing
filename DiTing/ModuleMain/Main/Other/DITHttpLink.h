//
//  DITHttpLink.h
//  DiTing
//
//  Created by ZHUYN on 2017/9/20.
//  Copyright © 2017年 zyn. All rights reserved.
//

#ifndef DITHttpLink_h
#define DITHttpLink_h

#define BaseURL         @"http://127.0.0.1:3000/"
#define URLTool(x,y)    [NSString stringWithFormat:@"%@%@%@", BaseURL,x,y]

// 模块
#define API_WeChat      @"wec/"


// 接口
#define home_allMsg     URLTool(API_WeChat,@"allMsg")



#endif /* DITHttpLink_h */
