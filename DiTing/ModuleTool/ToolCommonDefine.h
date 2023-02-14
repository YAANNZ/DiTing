//
//  ToolCommonDefine.h
//  Pods
//
//  Created by huangjiming on 2018/11/14.
//

#ifndef ToolCommonDefine_h
#define ToolCommonDefine_h

// debug log add by chunlei.sun
#ifdef DEBUG

#define RRDebugLog(fmt, ...) NSLog((@"[file:%s] \n" "[function:%s] \n" "[lineNumber:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define RRDebugLog(format, ...)
#endif

//language
#define RS_CURRENT_LANGUAGE_TABLE  ([[NSUserDefaults standardUserDefaults] objectForKey:@"LanguageSwtich"] ? [[NSUserDefaults standardUserDefaults] objectForKey:@"LanguageSwtich"] : @"zh-Hans")

//Time zone
#define RRLocaleZone @"en_US"

//color
#define RRColorRandom [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0x0000FF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]

FOUNDATION_EXPORT UIColor *UIDynamicColorWithRGBValue(NSInteger rgbLight, NSInteger rgbDark);
FOUNDATION_EXPORT UIColor *UIDynamicColorWithRGBAValue(NSInteger rgbLight, CGFloat alphaLight, NSInteger rgbDark, CGFloat alphaDark);

FOUNDATION_EXPORT UIColor *UIDynamicColorWithRGB(CGFloat rLight, CGFloat gLight, CGFloat bLight, CGFloat rDark, CGFloat gDark, CGFloat bDark);
FOUNDATION_EXPORT UIColor *UIDynamicColorWithRGBA(CGFloat rLight, CGFloat gLight, CGFloat bLight, CGFloat alphaLight, CGFloat rDark, CGFloat gDark, CGFloat bDark, CGFloat alphaDark);

//Commonly used color
#define RRSystemColor                   UIColorFromRGB(0x2492fc)
#define RRSystemColorRGBA(alphaValue)   UIColorFromRGBA(0x2492fc, alphaValue)
#define RRSystemColorHex                0x2492fc
#define RRTintColorDisabled             UIColorFromRGBA(0x2492fc, 0.3)
#define RRBackgroundColor               UIDynamicColorWithRGBValue(0xf6f7fb, 0x000000)
#define RRLineColor                     UIDynamicColorWithRGBValue(0xe1e2e6, 0x3d3d41)
#define RRNewLineColor                  UIDynamicColorWithRGBAValue(0xF0F2F8, 1, 0xF0F2F8, 0.05)
#define RRSelectedCellColor             UIDynamicColorWithRGBValue(0xebecf1, 0x323235)
#define RRNaviBarBgColor                UIColorFromRGBA(0xffffff, 0.9)
#define RRContentBackgroundColor212121        UIDynamicColorWithRGBValue(0xffffff, 0x212121)
#define RRContentBackgroundColor191919        UIDynamicColorWithRGBValue(0xffffff, 0x191919)

//Commonly used dark mode font color
#define RRPrimaryDarkTextColor          UIColorFromRGB(0xfefffe)
#define RRSecondaryDarkTextColor        UIColorFromRGB(0x8d8d93)

#define RRWhiteColor                    [UIColor whiteColor]
#define RRBlackColor                    [UIColor blackColor]
#define RRBlueColor                     [UIColor blueColor]
#define RRGreenColor                    [UIColor greenColor]
#define RRRedColor                      [UIColor redColor]
#define RRYellowColor                   [UIColor yellowColor]
#define RRLightGrayColor                [UIColor lightGrayColor]
#define RRDarkGrayColor                 [UIColor darkGrayColor]
#define RRGrayColor                     [UIColor grayColor]
#define RRClearColor                    [UIColor clearColor]


//The font
#define UIFontFromSizeWeight(i_size, i_weight)  [UIFont systemFontOfSize:i_size weight:i_weight]

//models
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE6PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)
#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define IS_IPHONE_X_LANDSCAPE (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 812.0f)

//The iOS version
#define SYSTEM_VERSION      [[[UIDevice currentDevice] systemVersion] floatValue]
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define IOS8            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)

//The app version
#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//To prevent a circular reference
#define WEAK_SELF           __weak __typeof(self)weakSelf = self;
#define STRONG_SELF         __strong __typeof(weakSelf)self = weakSelf;

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

//The golden ratio
#define BEST_SCALE_VALUE    0.618

//The picture
#define kSuperImageRatio 2.9// Long figure ratio 3:1
#define kHighQualityMaxLength 1024 // High-definition pictures fixed width or height

//The screen
#define SCREEN_WIDTH        ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT       ([UIScreen mainScreen].bounds.size.height)
#define UIScreenWidth       ([UIScreen mainScreen].bounds.size.width)
#define UIScreenHeight      ([UIScreen mainScreen].bounds.size.height)

#define NAV_BAR_HEIGHT      (44)
#define PHONE_NAVIGATIONBAR_HEIGHT 44.0f
#define STATUS_BAR_HEIGHT   (IS_IPHONE_X ? 44.f : 20.f)
#define PHONE_STATUSBAR_HEIGHT  (IS_IPHONE_X ? 44.f : 20.f)
#define STATUS_NAV_BAR_HEIGHT   (STATUS_BAR_HEIGHT+NAV_BAR_HEIGHT)
#define PHONE_NAVIGATIONBAR__HEIGHT_R  (IS_IPHONE_X ? 88.f : 64.f)
#define PHONEX_HOME_INDICATOR_HEIGHT   (IS_IPHONE_X ? 34.f : 0)//The height of the vertical control area at the bottom of the screen iPhoneX when
#define PHONEX_HOME_INDICATOR_LANDSCAPE_HEIGHT   (IS_IPHONE_X ? 21.f : 0)//The height of the landscape when iPhoneX manipulation at the bottom of the area
#define TAB_BAR_HEIGHT      (49)
#define PHONE_CUSTOM_TABBAR_HEIGHT (50.f + PHONEX_HOME_INDICATOR_HEIGHT)
#define VIEW_SHORT_HEIGHT   (SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAV_BAR_HEIGHT-TAB_BAR_HEIGHT)
#define PHONE_CONTENT_HEIGHT (SCREEN_HEIGHT - PHONE_STATUSBAR_HEIGHT - PHONE_NAVIGATIONBAR_HEIGHT)
#define VIEW_LONG_HEIGHT    (SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAV_BAR_HEIGHT)
#define SAFE_AREA_HEIGHT    ([[[UIDevice currentDevice] systemVersion] floatValue]<11 ? 0 : STATUS_BAR_HEIGHT)

//pixel
#define KLayoutSeperationLineWidth (1/[UIScreen mainScreen].scale)
#define PHONE_NAVIGATIONBAR_BUTTON_GAP  (IS_IPHONE6PLUS ? 20.f : 16.f)//Adaptive navigation bar spacing
#define SCREEN_SCALE        (SCREEN_WIDTH/375.f)
#define ScaleNum(x)         (int)((x)*SCREEN_SCALE)
#define SCALE_NUM(x)        ((x)*SCREEN_SCALE)

#define kRRSizeRatio (SCREEN_WIDTH / 375)
#define kRR300Size (300 * kRRSizeRatio)
#define kRRHeightRatio (SCREEN_HEIGHT / 667)
#define kRRSizeRatioLandscape (SCREEN_WIDTH / 667)

#define DENSITY_6 (SCREEN_HEIGHT==480?(SCREEN_HEIGHT/1334.0/1.05):(SCREEN_HEIGHT/1334.0))
#define evaluate_6(x) ceil((x)*DENSITY_6)

#define DENSITY_V     SCREEN_HEIGHT/1334.0
#define evaluate_v(x) ceil((x)*DENSITY_V)

#define DENSITY_6W SCREEN_WIDTH/750.0
#define evaluate_6W(x) ceil((x)*DENSITY_6W)

#define DENSITY_GUIDE_H (SCREEN_HEIGHT / 667) * 0.99
#define evaluate_Guide(y) ceil((y)*DENSITY_GUIDE_H)

//The keyboard
#define PUBLISH_ENGISH_KEYBOARD_TOP (IS_IPHONE_X ? 291.f : 216.f)//The height of the state of the keyboard in English

//File storage directory
#define kChatFileDir @"chatfile"
#define kPersistDir  @"persist"
#define kPostImageFileDir @"post/image"
#define kPostSoundFileDir @"post/voice"
#define kAudioCacheDir  @"audio_cache"
#define kImageEditCacheDir @"imageEditCache"

//specifications
#define MARGIN 12.0f
#define BORDERWIDTH 2.0f
#define CORNERRADIUS CGSizeMake(5, 5)

//Leak
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

//release
#if OS_OBJECT_USE_OBJC
#undef RHCDispatchRelease
#define RHCDispatchRelease(q)
#else
#undef RHCDispatchRelease
#define RHCDispatchRelease(q) (dispatch_release(q))
#endif

#define RELEASE(__POINTER) { if (nil != (__POINTER)) { CFRelease(__POINTER); __POINTER = nil; } }
#define RRLocalizedString(str) NSLocalizedString(str, str)

//view
#define RRActionViewCancelTag 9999

//Compatible with
#ifndef NULL
#define NULL nil
#endif

#endif /* ToolCommonDefine_h */
