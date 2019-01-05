//
//  MusicChannelDetailModel.swift
//  TuYa_iOS
//
//  Created by yuangonmg on 2019/1/5.
//  Copyright © 2019 Dian. All rights reserved.
//

import UIKit
import ObjectMapper

struct MusicChannelDetailModel: Mappable {
    
    var channel: String?
    
    var songListModel: [SongListModel]?     /// 图片url
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        songListModel <- map["songlist"]
        channel <- map["channel"]
    }
}
