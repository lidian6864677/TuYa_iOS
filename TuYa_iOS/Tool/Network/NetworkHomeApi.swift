//
//  NetworkHomeApi.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/27.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Result
//    http://47.104.192.159:8888/url/all
//初始化请求
let GetNetworkJobData = MoyaProvider<NetworkHomeApi>()

/** 下面定义豆瓣FM请求的endpoints（供provider使用）**/
//请求分类
 enum NetworkHomeApi {
    case GetHomeTopImage        // 获取首页列表
    case GetJobList(String)     // 获取首页招聘信息列表
    case GetChannels            // 获取首页列表
    case GetJobDetail(String)   // 获取工作详情
//    case playlist(String) //获取歌曲
}

//请求配置
extension NetworkHomeApi: TargetType {
    
    ///>  各个请求的具体路径
    public var path: String {
        switch self {
        case .GetHomeTopImage:
            return "/url/all"
        case .GetJobList:
            return "/kdniaosandbox/gateway/exterfaceInvoke.json"
        case .GetJobDetail:
            return "/details/detailsData"
        case .GetChannels:
            return "/j/app/radio/channels"
        }
    }
    
    ///>  请求类型
    public var method: Moya.Method {
        return .get
    }
    
    ///>  请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .GetJobList(let page):
            var params: [String: Any] = [:]
            params["pageNum"] = page
            params["pageSize"] = (10)
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        case .GetJobDetail(let id):
            var params: [String: Any] = [:]
            params["merchant_id"] = id
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
