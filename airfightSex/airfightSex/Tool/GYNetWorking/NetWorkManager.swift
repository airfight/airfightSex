//
//  NetWorkManager.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/26.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation

class NetWorkManager {

    
    /// 通用方法
    ///
    /// - parameter method:   method description
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func request(method: GYNetWorkMethod,url: String!,params:[String: Any],callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: method, params: params, callBack: callBack)
        manager.startFire()
        
    }
    
    
    /// 带参数的GET请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func GET(url: String!,params:[String: Any],callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .GET, params: params, callBack: callBack)
        manager.startFire()
        
    }
    
    
    /// 不带参数的GET请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func GET(url: String!,callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .GET, params: nil, callBack: callBack)
        manager.startFire()
        
    }
    
    /// 带参数的POST请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func POST(url: String!,params:[String: Any],callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .POST, params: params, callBack: callBack)
        manager.startFire()
        
    }
    
    /// 不带参数的GET请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func POST(url: String!,callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .POST, params: nil, callBack: callBack)
        manager.startFire()
        
    }
}
