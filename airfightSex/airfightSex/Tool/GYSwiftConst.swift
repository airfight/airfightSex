//
//  GYSwiftConst.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

class GYSwiftConst: NSObject {
    
    
    
    /// RGB颜色设置方法
    ///
    /// - parameter r:
    /// - parameter g:
    /// - parameter b:
    /// - parameter a:
    ///
    /// - returns: UIColor
    static func rgba(r:CGFloat,g: CGFloat,b: CGFloat,a: CGFloat) -> UIColor {
        
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
        
    }
}
		
