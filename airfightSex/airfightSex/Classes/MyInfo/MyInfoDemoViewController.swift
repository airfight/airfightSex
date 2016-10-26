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
        
//        YTKNetworkAgent.shared().add(YTKBaseRequest.)
        //password=5edf55f00c39082d3e&terminalType=4&username=15221981520&versionNumber=373
        GYNetWork.request(method: GYNetWorkMethod.POST, url: "http://api.smzdm.com/v2/duihuan", params: "f=iphone&limit=20&offset=0&type=quan&v=6.3.2&weixin=1") { (data, response, error) in
            if data != nil {
                
                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
//                print(JSON(data!).dictionaryObject?["flag"])
                print(JSON(data:data!).dictionaryObject?["error_code"])
            }
            
            if response != nil {
                print(response)
                
            }
            
            
            if error != nil {
                print(error)
            }

        }
    
        
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
