//
//  NetworkJob.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/27.
//  Copyright © 2018年 Dian. All rights reserved.
//
//
import UIKit
import RxSwift
import RxCocoa
import Moya
import Alamofire
private let URL_HEADER_IMAGE_HOME = "/url/all"  /// 首页顶部轮播图 url



enum NetworkJob{
    case GetHomeTopImage // 获取首页列表
//    case GetHomeDetail(Int)  // 获取详情页
    
}


//let requestJobData = RxMoyaProvider<NetworkJob>(endpointClosure: endpointMapping, manager: defaultAlamofireManager(), plugins: [LLRequestPlugin(),netWorkActivityPlugin])
//let rqeuset = RxMoyaProvider()


extension NetworkJob: TargetType {
    var headers: [String : String]? {
        return ["a":"a"]
    }
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL.init(string: BASE_URL_Test)!
    }
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
            
        case .GetHomeTopImage: // 不带参数的请求
            return URL_HEADER_IMAGE_HOME
//        case .GetHomeDetail(let id):  // 带参数的请求
//            return "4/theme/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    /// The parameters to be incoded in the request.
    var parameters: [String: Any]? {
        return nil
    }
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    /// The type of HTTP task to be performed.
    var task: Task {
//        return .request
        return .requestPlain
    }
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
    
}




enum LLRefreshStatus {
    case none
    case beginHeaderRefresh
    case endHeaderRefresh
    case beginFooterRefresh
    case endFooterRefresh
    case noMoreData
}


public func defaultAlamofireManager() -> Manager {
    
    let configuration = URLSessionConfiguration.default
    
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    
    let policies: [String: ServerTrustPolicy] = [
        "ap.grtstar.cn": .disableEvaluation
    ]
    let manager = Alamofire.SessionManager(configuration: configuration,serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
    
    manager.startRequestsImmediately = false
    
    return manager
}


private func endpointMapping<Target: TargetType>(target: Target) -> Endpoint<Target> {
    
    print("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.path)) ")
    
    return MoyaProvider.defaultEndpointMapping(for: target)
}




//
//private let requestTimeoutClosure = { (endpoint: Endpoint<NetworkJob>, done: @escaping MoyaProvider<NetworkJob>.RequestResultClosure) in
//    guard var request = endpoint.urlRequest else { return }
//    //设置请求超时时间
//    request.timeoutInterval = 10
//    done(.success(request))
//}
//internal final class HomeAPIAccessTokenPlugin: PluginType {
//    func willSend(_ request: RequestType, target: TargetType) {
//
//    }
//    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//
//    }
//}
//let NetworkJob = RxMoyaProvider<NetworkJob>(requestClosure:requestTimeoutClosure,plugins: [HomeAPIAccessTokenPlugin()])
//let NetworkJob = MoyaProvider.rx.request(<#T##Reactive<MoyaProvider<_>>#>)
//public enum NetworkJob {
//    case getHomeImage
////    case getHome(city:String, iosVersion: String,username: String)
//}
//extension NetworkJob: TargetType {
//    public var headers: [String : String]? {
//        return nil
//    }
//
//    public var baseURL: URL {
//        return URL(string: BASE_URL_Test)!
//    }
//
//    public var path: String {
//        switch self {
//        case .getHomeImage:
//            return URL_HEADER_IMAGE_HOME
//        }
//    }
//
//    public var method: Moya.Method {
////        switch self {
////        case .getVersion:
////            return .post
////        default:
//            return .get
////        }
//    }
//
//    public var parameters: [String : Any]? {
//        switch self {
//        case .getHomeImage:
//            return nil
////        case .getHome(let cityname, let iosVersion, let username):
////            return ["cityName":cityname, "iosVersion":iosVersion, "username": username]
//
//        }
//    }
//
//    public var parameterEncoding: ParameterEncoding {
//        switch self {
//        default:
//            return URLEncoding.default
//        }
//    }
//
//    public var task: Task {
//        switch self {
//        default:
//            return .request
//        }
//    }
//
//    public var sampleData: Data {
//        switch self {
//        default:
//            return "".data(using: String.Encoding.utf8)!
//        }
//    }
//}

