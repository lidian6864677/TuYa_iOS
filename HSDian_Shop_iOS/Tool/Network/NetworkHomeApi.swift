//
//  NetworkHomeApi.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/27.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Result
//    http://47.104.192.159:8888/url/all
private let URL_HEADER_IMAGE_HOME = "/url/all"  /// 首页顶部轮播图 url
private let URL_JOB_LIST = "/homePageData/queryData"  /// 首页顶部轮播图 url
        
//初始化qing'qiu
let GetNetworkJobData = MoyaProvider<NetworkHomeApi>()

/** 下面定义豆瓣FM请求的endpoints（供provider使用）**/
//请求分类
 enum NetworkHomeApi {
    case GetHomeTopImage // 获取首页列表
    case GetJobList(String) // 获取首页招聘信息列表
    case GetChannels // 获取首页列表
//    case playlist(String) //获取歌曲
}

//请求配置
extension NetworkHomeApi: TargetType {
    
    //服务器地址
    public var baseURL: URL {
        switch self {
        case .GetChannels  :
            return URL(string: "https://www.douban.com")!
        default:
            return URL(string: BASE_URL_Test)!
        }
    }
    
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .GetHomeTopImage:
            return URL_HEADER_IMAGE_HOME
        case .GetJobList:
            return URL_JOB_LIST
        case .GetChannels:
            return "/j/app/radio/channels"
        }
    }
    
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .GetJobList(let page):
            var params: [String: Any] = [:]
            params["pageNum"] = page
            params["pageSize"] = (10)
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    //请求头
    public var headers: [String: String]? {
        return nil
    }
    static func errorMessage(error: MoyaError) {
        switch error {
        case .jsonMapping(let res):
            guard let resString = try? res.mapJSON() as? [String : Any] else {
                DLLog("网络请求失败")
                return
            }
            DLLog(resString)
            showTost(parametersStr: resString?["message"] as! String)
        default:
            DLLog("a")
        }
    }
    private static func showTost(parametersStr: String) {
        DLLog(parametersStr)
    }
}
