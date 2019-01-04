//
//  CitySelectorViewModel.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class CitySelectorViewModel: NSObject {
    /// 全部城市数据
    lazy var allCitiesDict: [String: [String]] = {
        let path = Bundle.main.path(forResource: "Cities_All.plist", ofType: nil)
        let dict = NSDictionary(contentsOfFile: path ?? "") as? [String: [String]]
        return dict ?? [:]
    }()
    /// 热门城市数据
    lazy var hotCities: [String] = {
        let path = Bundle.main.path(forResource: "Cities_Hot.plist", ofType: nil)
        let array = NSArray(contentsOfFile: path ?? "") as? [String]
        return array ?? []
    }()
    /// 标题数组
    lazy var titleArray: [String] = {
        var array = [String]()
        for str in self.allCitiesDict.keys {
            array.append(str)
        }
        // 标题排序
        array.sort()
        array.insert("热门", at: 0)
        array.insert("最近", at: 0)
        array.insert("当前", at: 0)
        return array
    }()
    
    
    
}
