//
//  BaseModel.swift
//  TuYa_iOS
//
//  Created by yuangonmg on 2019/1/4.
//  Copyright © 2019 Dian. All rights reserved.
//

import UIKit
import ObjectMapper

class JsonDataModel: Mappable {
    var code: Int = -1     /// 图片url
    var message: String = ""     /// 图片url
    var result: [String : Any]?     /// 图片url
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        message <- map["message"]
    }
}

