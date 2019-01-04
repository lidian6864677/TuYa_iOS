//
//  DLUserDefaults.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/30.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

let UserDefaults_Top_image_Banner = "UserDefaults_Top_image_Banner"  /// 首页顶部轮播图 url

class DLUserDefaults: NSObject {
    static let shareDLUserDefaults = DLUserDefaults()
    let userDefault = UserDefaults.standard
    func setDefaultsArray(key: String, saveArray: Array<Any>) {
        userDefault.set(saveArray, forKey: key)
        userDefault.synchronize()
    }
    func getDefaultsArray(key: String) -> Array<Any> {
        let array = userDefault.array(forKey: UserDefaults_Top_image_Banner) ?? []
        if array.count > 0 {
            return array
        }else{
            return ["home_top_image_004.jpg"]
        }
    }
    
}
