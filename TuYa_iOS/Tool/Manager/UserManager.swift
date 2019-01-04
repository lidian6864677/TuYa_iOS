//
//  UserManager.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/6/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    static let share = UserManager()
    var user: UserInfoBaseModel?  /// 用户信息
    func updateUserInfo() {
        user = UserInfoBaseModel(userName: "Dian。", userPhoto: "http://img3.imgtn.bdimg.com/it/u=3258183187,2737981932&fm=200&gp=0.jpg", balance: "10")
    }
}
