//
//  SongListModel.swift
//  TuYa_iOS
//
//  Created by yuangonmg on 2019/1/5.
//  Copyright © 2019 Dian. All rights reserved.
//

import UIKit
import ObjectMapper


struct SongListModel: Mappable {
    var artist: String?     
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        artist <- map["artist"]
    }
}
