//
//  MyInfoDemoViewController.swift
//  airfightSex
//
//  Created by giant on 16/10/23.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SwiftyJSON

class MyInfoDemoViewController: UIViewController {

    
    @IBOutlet weak var userNamelB: UITextField!
    
    @IBOutlet weak var pwdLb: UITextField!
    
    @IBAction func loginBtnAction(_ sender: AnyObject) {

    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        IQKeyboardManager.sharedManager().enable = true
        //点击背景隐藏键盘
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
        //设置Next
        _ = IQKeyboardReturnKeyHandler.init(controller: self)

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
