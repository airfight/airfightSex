//
//  GYNetWorking.swift
//  airfightSex
//
//  Created by giant on 16/10/25.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit
import YTKNetwork

class RegisterApi: YTKRequest {
    
//    static let gyNetWorkingSingleTon: GYNetWorking = {
//        
//        let instance = GYNetWorking()
//        
//        return instance
//        
//    }()
    
    private var userName: String!
    private var pwd: String!
    
    
    /// 注册
    ///
    /// - parameter userName: 账户
    /// - parameter pwd:      密码
    ///
    /// - returns: RegisterApi
    init(userName: String,pwd: String){
        self.userName = userName
        self.pwd = pwd
    }
    
    override func requestUrl() -> String {
        
        return ""
    }
    
    override func requestMethod() -> YTKRequestMethod {
        
        
        return YTKRequestMethod.GET
    }
    
    override func requestArgument() -> Any? {
        
        return []
    }

}
