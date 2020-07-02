//
//  ViewController.h
//  DiTing
//
//  Created by ZHUYN on 2017/2/6.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

extension UIImage {
    // 压-降低质量
    func compression(_ compressionQuality: CGFloat) -> NSData {
        if let data = UIImageJPEGRepresentation(self, compressionQuality) {
            return data as NSData
        }
        return NSData()
    }
    
    // 缩-降低尺寸
    func shrink(_ targetWidth: CGFloat) -> NSData {
        let targetHeight = targetWidth/self.size.width*self.size.height
        UIGraphicsBeginImageContext(CGSize.init(width: targetWidth, height: targetHeight))
        self.draw(in: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: targetWidth, height: targetHeight)))
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let img = newImg, let data = UIImageJPEGRepresentation(img, 1.0) {
            return data as NSData
        }
        return NSData()
    }
    
    // 压缩-降低质量、尺寸
    func compressionImage(_ compressionQuality: CGFloat, _ targetWidth: CGFloat) -> NSData {
        let targetHeight = targetWidth/self.size.width*self.size.height
        UIGraphicsBeginImageContext(CGSize.init(width: targetWidth, height: targetHeight))
        self.draw(in: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: targetWidth, height: targetHeight)))
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let img = newImg, let data = UIImageJPEGRepresentation(img, compressionQuality) {
            return data as NSData
        }
        return NSData()
    }
}
