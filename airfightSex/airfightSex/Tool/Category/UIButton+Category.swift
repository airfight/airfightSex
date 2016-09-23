//
//  UIButton+Category.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

extension UIButton {
    
    static func createButton(imageName: String?,slectImageName: String?,title:String?,target: AnyObject?,action:Selector?) -> UIButton{
        
        let btn = UIButton()
        
        if let titleS = title {
            btn.setTitle(titleS, for: UIControlState.normal)
        }
        
        if imageName != nil {
            btn.setImage(UIImage(named: imageName!), for: UIControlState.normal)
        }
        
        if let selectName = slectImageName {
            btn.setImage(UIImage(named: selectName), for: UIControlState.selected)
        }
        
        if let action1 = action {
              btn.addTarget(target, action: action1, for: UIControlEvents.touchUpInside)
        }
        
      
        
        btn.sizeToFit()
        
        return btn
        
    }
}
