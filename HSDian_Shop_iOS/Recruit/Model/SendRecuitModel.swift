//
//  SendRecuitModel.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/19.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class SendRecuitModel: NSObject {
    /// 功能名称
    var titleName: String?
    /// 功能图片
    var titleImage: String?
    /// 文字内容
    var content: String?
    /// cell type
    var optionType: RecruitOptionType?
    
    
    /// 手动解析
    init(titleName: String, titleImage: String, content: String, optionType:RecruitOptionType){
        super.init()
        self.titleName = titleName
        self.titleImage = titleImage
        self.content = content
        self.optionType = optionType
    }
}
