//
//  BooksViewController.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit
import YTKNetwork

class BooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = YTKNetworkConfig.shared()
        config.baseUrl = "www.baidu.com"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIButton.createButton(imageName: nil, slectImageName: nil, title: "蜀黍", target: self, action: Selector(("btnAction"))))
        
        
//        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
//        subView.backgroundColor = UIColor.black
//        navigationItem.titleView = subView
        
        let viewS = GYTabBarTitleView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 20), leftBtnTitle: "本地", rightBtnTitle: "云端")
        viewS.rightBtn?.isSelected = true
        navigationItem.titleView = viewS
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        subView.backgroundColor = UIColor.black
        navigationItem.titleView = subView
        
        let registerApi = RegisterApi.init(userName: "123", pwd: "456")
        
        registerApi.startWithCompletionBlock(success: { (request) in
            
            print("成功")
            }) { (request) in
                print("失败")
        }
        
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
