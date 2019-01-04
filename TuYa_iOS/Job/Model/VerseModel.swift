//
//  VerseModel.swift
//  TuYa_iOS
//
//  Created by yuangonmg on 2019/1/4.
//  Copyright © 2019 Dian. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper


struct VerseModel: Mappable {
    var jobName: String?     /// 工作内容
    var address: String?     /// 工作地点
    var time: String?        /// 工作时间
    var money: String?       /// 价格
    var settlement: String?  /// 结算方式
    var companyIcon: String? /// 公司 logo
    
    
    
    var authors: String?  /// 结算方式
    var content: String?  /// 结算方式
    var title: String?    /// 结算方式
//    var companyIcon: String? /// 公司 logo
    var companyName: String {
        return "text途虎"
    } /// 工作单位
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        jobName     <- map["content"]
        address     <- map["title"]
        time        <- map["authors"]
        money       <- map["authors"]
        
        
        
        settlement  <- map["origin"]
        companyIcon <- map["content"]
        authors     <- map["category"]
        content     <- map["author"]
        //        companyName <- map["merchantName"]
    }
}
