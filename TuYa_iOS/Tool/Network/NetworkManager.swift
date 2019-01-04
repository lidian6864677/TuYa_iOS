//
//  NetworkManager.swift
//  TuYa_iOS
//
//  Created by yuangonmg on 2019/1/3.
//  Copyright © 2019 Dian. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper
import Alamofire

final class NetworkManager {
    
    class var manager: NetworkManager {
        struct SingletonWrapper {
            static let singleton = NetworkManager()
        }
        return SingletonWrapper.singleton
    }
    
    //服务器地址
    public var baseURLHandle: URL {
        return Network.BASE_URL_Test as URL
    }
    
    //是否执行Alamofire验证
    public var validateHandle: Bool {
        return false
    }
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleDataHandle: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    
    let userAgent: String = {
        //        let appVersion: String = AppVersion.marketingVersion.versionString
        //        let model = Device.version()
        let systemVersion = UIDevice.current.systemVersion
        let screenScale = UIScreen.main.scale
        //        let str = "36kr-iOS/\(appVersion) (\(model)); iOS \(systemVersion); Scale/\(screenScale);"
        let str = "iOS \(systemVersion); Scale/\(screenScale);"
        return str
        
    }()
    
    var customHTTPHeader: [String: String] {
        //        let deviceId = SecurityManager.manager.deviceUniqueId
        //        let sign = SecurityManager.manager.timestampAndSign.sign
        //        let timestamp = SecurityManager.manager.timestampAndSign.timestamp
        let ua = self.userAgent
        return ["User-Agent": ua,
                "Accept" : "application/json",
                //                "device" : deviceId,
            //                "uniqueId" : ASIdentifierManager.shared().advertisingIdentifier.uuidString,
            //                "sign" : sign,
            //                "timestamp" : timestamp
        ]
    }

   
    
    func errorMessageHandle(error: MoyaError) {
        switch error {
        case .jsonMapping(let res):
            guard let resString = try? res.mapJSON() as? [String : Any] else {
                DLLog("\n❌⬇️❌⬇️❌--< 网络请求失败 >--❌⬇️❌⬇️❌\n\n API:\n  \(String(describing: error.response?.request)) \n\n error:\n  \(String(describing:  error.response))\n\n❌⬆️❌⬆️❌--< 网络请求失败 >--❌⬆️❌⬆️❌")
                return
            }
            showTost(parametersStr: resString?["message"] as! String)
        default:
            DLLog("a")
        }
    }
    private func showTost(parametersStr: String) {
        DLLog(parametersStr)
    }
    
    class func currentNetReachability() {
        let manager = NetworkReachabilityManager()
        manager?.listener = { status in
            var statusStr: String?
            switch status {
            case .unknown:
                statusStr = "未识别的网络"
                break
            case .notReachable:
                statusStr = "不可用的网络(未连接)"
            case .reachable:
                if (manager?.isReachableOnWWAN)! {
                    statusStr = "2G,3G,4G...的网络"
                } else if (manager?.isReachableOnEthernetOrWiFi)! {
                    statusStr = "wifi的网络";
                }
                break
            }
            DLLog(statusStr as Any)
        }
        manager?.startListening()
    }
}
