//
//  GYTransparentNavController.swift
//  airfightSex
//
//  Created by giant on 16/10/27.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

extension UINavigationController{
    
     var transView: UIView? {
        get {
            if self.isKind(of: GYTransparentNavController.self) {
                
                return self.navigationBar.viewWithTag(6666)!
            }
            return nil
        }
    }
    
}

class GYTransparentNavController: UINavigationController {

    var transparentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //1.创建透明图片
        let image = transparentSize(CGSize(width: 1, height: 1))
        
        self.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        
        self.transparentView = UIView(frame: CGRect(x: 0, y: -20, width: self.navigationBar.bounds.size.width, height: 64))
        
        self.transparentView.tag = 6666
        
        self.navigationBar.insertSubview(self.transparentView, at: 0)
        
        self.navigationBar.shadowImage = UIImage()
        
        
    }

    
    func transparentSize(_ size:CGSize) -> UIImage{
        
        //size 图片大小
        //opaque:false为全透明
        //scale 缩放因子
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image!
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
