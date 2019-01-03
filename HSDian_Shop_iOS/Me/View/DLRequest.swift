//
//  DLRequest.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/27.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import Moya
import Result


let netWorkActivityPlugin = NetworkActivityPlugin { (change, nil) -> () in
    
    switch(change){
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}


public final class LLRequestPlugin: PluginType {
    
    /// Called immediately before a request is sent over the network (or stubbed).
    public func willSend(_ request: RequestType, target: TargetType) {
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            let json:Dictionary? = try! JSONSerialization.jsonObject(with: response.data,                                                                     options:.allowFragments) as! [String: Any]
            print(json as Any)
//            LLProgressHUD.showSuccess("加载成功")
        case .failure:
//            LLProgressHUD.showError("加载失败")
            break
        }
        
    }
}
