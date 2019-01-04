//
//  UserInfoBaseModel.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/6/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class UserInfoBaseModel: NSObject {
    var userName:    String?   /// 用户姓名
    var userPhoto:   String?   /// 用户头像
    var balance:     String?   /// 账户余额
    
    
    
    
    /// 手动解析
    init(userName: String?, userPhoto: String?, balance: String?){
        super.init()
        self.userName = userName
        self.userPhoto = userPhoto
        self.balance  = balance
    }
    override init() {
        super.init()
    }
}
