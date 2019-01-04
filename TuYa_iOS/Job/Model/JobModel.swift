//
//  JobModel.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/22.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import ObjectMapper


struct JobModel: Mappable {
    var jobName: String?     /// 工作内容
    var address: String?     /// 工作地点
    var time: String?        /// 工作时间
    var money: String?       /// 价格
    var settlement: String?  /// 结算方式
    var companyIcon: String? /// 公司 logo
    var companyName: String {
        return "text途虎"
    } /// 工作单位
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        jobName     <- map["job"]
        address     <- map["merchantAddress"]
        time        <- map["startTime"]
        money       <- map["payMoney"]
        settlement  <- map["payType "]
        companyIcon <- map["companyIcon"]
//        companyName <- map["merchantName"]
    }
}


/// 首页顶部图片


struct JobTopImageModel: Mappable {
    var imageUrl: String?     /// 图片url
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        imageUrl <- map["url"]
    }
}

