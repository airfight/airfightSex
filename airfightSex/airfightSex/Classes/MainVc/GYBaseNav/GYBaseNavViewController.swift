//
//  GYBaseNavViewController.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

@objc(GYBaseNavViewController)

class GYBaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = tabbarbgColor
        
        // Do any additional setup after loading the view.
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
