//
//  DITCompCompressImgViewController.swift
//  DiTing
//
//  Created by ZHUYN on 2020/7/3.
//  Copyright © 2020 zyn. All rights reserved.
//

import UIKit

class DITCompCompressImgViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    

}

extension UIImage {
    // 压-降低质量
    func compression(_ compressionQuality: CGFloat) -> NSData {
        if let data = self.jpegData(compressionQuality: compressionQuality) {
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

        if let img = newImg, let data = img.jpegData(compressionQuality: 1.0) {
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

        if let img = newImg, let data = img.jpegData(compressionQuality: compressionQuality) {
            return data as NSData
        }
        return NSData()
    }
}
