
//
//  SendRecuitDataManager.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/20.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class SendRecuitDataManager: NSObject {
    static let share = SendRecuitDataManager()
    func getSendRecitData() -> [[SendRecuitModel]] {
        let array: [[SendRecuitModel]] = [
            /// 第一组
            [
                SendRecuitModel(titleName: "工作类型", titleImage: "", content: "请填写工作类型", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "招聘人数", titleImage: "", content: "请选择招聘人数", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "结算周期", titleImage: "", content: "请选择结算周期 ", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "基本工资", titleImage: "", content: "请填写工资", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "性别要求", titleImage: "", content: "请选择性别", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "工作日期", titleImage: "", content: "请选择开始与结束日期", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "上班时段", titleImage: "", content: "请选择上班时段", optionType: MeDataOptionType.normal),
                ],
            /// 第二组
            [
                SendRecuitModel(titleName: "职位描述", titleImage: "", content: "填写您的工作描述字数在20-500字内", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "工作地点", titleImage: "", content: "请选择工作地点", optionType: MeDataOptionType.normal),
                ],
            [
                SendRecuitModel(titleName: "联系姓名", titleImage: "", content: "请填写联系人姓名", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "联系电话", titleImage: "", content: "请填写常用手机号码", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "联系邮箱", titleImage: "", content: "请填写常用邮箱", optionType: MeDataOptionType.normal),
                SendRecuitModel(titleName: "报名咨询", titleImage: "", content: "请填写", optionType: MeDataOptionType.normal),
                ]
        ];
        return array
    }
}

