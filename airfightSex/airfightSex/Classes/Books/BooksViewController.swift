//
//  BooksViewController.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIButton.createButton(imageName: nil, slectImageName: nil, title: "蜀黍", target: self, action: Selector(("btnAction"))))
        
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        subView.backgroundColor = UIColor.black
        navigationItem.titleView = subView
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
