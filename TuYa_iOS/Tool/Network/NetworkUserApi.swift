//
//  NetworkUserApi.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/6/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Result
//    http://47.104.192.159:8888/url/all

//初始化qing'qiu
let GetNetworkUser = MoyaProvider<NetworkHomeApi>()

//请求分类
enum NetworkUserApi {
    case GetUserInfoDetail(String)               ///> 用户详情
    case GetCollectionJobInfo(userID: String)    ///> 点击收藏
    case GetCollectionJobInfoList()              ///> 收藏列表
    case GetChannels                             ///> 获取首页列表
    case GetJobList(String)                      ///> 获取首页招聘信息列表
}

//请求配置
extension NetworkUserApi: TargetType {
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .GetUserInfoDetail:
            return "/userInfo/userInfoData"
        case .GetCollectionJobInfo:
            return "/collection/insertCollection"
        case .GetCollectionJobInfoList:
            return "/collection/selectCollection"
        case .GetChannels:
            return "/j/app/radio/channels"
        case .GetJobList:
            return "/j/app/radio/channels"
        }
    }
    
    //请求类型
    public var method: Moya.Method {
//        switch self {
//        case .subscribe,
//             .unsubscribe:
//            return .PUT
//        case .sendBPEmail:
//            return .POST
//        default:
            return .get
        }
    
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .GetUserInfoDetail(let id):
            var params: [String: Any] = [:]
            params["userUuid"] = id
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        case .GetCollectionJobInfo(let id):
            var params: [String: Any] = [:]
            params["job"] = id
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    
    
    ///>  服务器地址
    public var baseURL: URL {
        return NetworkManager.manager.baseURLHandle
    }
    
    ///>  是否执行Alamofire验证
    public var validate: Bool {
        return NetworkManager.manager.validateHandle
    }
    
    ///>  这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return NetworkManager.manager.sampleDataHandle
    }
    
    ///>  请求头
    public var headers: [String: String]? {
        return NetworkManager.manager.customHTTPHeader
    }
    
    ///>  网络请求失败提示
    static func errorMessage(error: MoyaError) {
        NetworkManager.manager.errorMessageHandle(error: error)
    }
}
