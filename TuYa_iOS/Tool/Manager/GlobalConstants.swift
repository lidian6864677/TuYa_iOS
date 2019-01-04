//
//  Const.swift
//  News
//
//  Created by 杨蒙 on 2017/9/13.
//  Copyright © 2017年 hrscy. All rights reserved.
//
import Foundation
import UIKit
// MARK:  configure 配置
//let BASE_URL_Test = "http://47.104.192.159:8888"
struct Network {
    #if DEBUG
    static let Domain = "http://sandboxapi.kdniao.com:8080"
//    static let RongDomain = "https://rongtest01.36kr.com"
//    static let RongDomain2 = "https://rongtest02.36kr.com"
    #else
    static let Domain = "http://sandboxapi.kdniao.com:8080"
//    static let RongDomain = "https://rong.36kr.com"
//    static let RongDomain2 = "https://rong.36kr.com"
    #endif
    static let BASE_URL_Test = URL(string: "\(Domain)")!
//    static let NewsPHPAPI = URL(string: "\(Domain)/pp/api")!
//    static let RongAPI = URL(string: "\(RongDomain)/api/mobi")!
}
let AMapAppKey = "2dcc3116d7e74561305f58a797a597e5"





// MARK:  界面 window && Navgation
let DLWindow = (UIApplication.shared.delegate as! AppDelegate).window   /// window
let DLGlobalNavigationController = DLWindow?.rootViewController as! UINavigationController  /// 全局Nav

// MARK: 适配高度
let DLScreenWidth         = UIScreen.main.bounds.width /// 屏幕的宽度
let DLScreenHeight        = UIScreen.main.bounds.height/// 屏幕的高度
let DLScreenRate          = DLScreenWidth/375 as CGFloat            /// 屏幕宽度适配
let DLTabBarHeight        = (isIPhoneX ? 83.0 : 49.0) as CGFloat     /// TabBar高度
let DLIphoneXBottomHeight = (isIPhoneX ? 34.0 : 0) as CGFloat        /// iPhone X 底部高度
let DLStatusBarHeight     = UIApplication.shared.statusBarFrame.height /// status高度（电池栏）
let DLnavigationBarHeight = { () -> CGFloat in          /// Navgation高度
    let nav = UINavigationController()
    let height = nav.navigationBar.frame.size.height
    return height
}()
let DLNavHeight : CGFloat = DLStatusBarHeight + DLnavigationBarHeight  /// 顶部栏的高度
//tableView,collectionView,scrollView的frame
let KUIDefaultFrame : CGRect = CGRect(x: 0, y: 0, width: DLScreenWidth, height: DLScreenHeight - DLNavHeight)
let DLStripBarButtonHeight = 45 as CGFloat        /// stripBarButtonHeight 高度




// MARK: iphone机型判断
let isIPhoneX:  Bool = DLScreenHeight == 812.0 ? true : false
let isIPhone6P: Bool = DLScreenHeight == 736.0 ? true : false
let isIPhone6:  Bool = DLScreenHeight == 667.0 ? true : false
let isIPhone5:  Bool = DLScreenHeight == 568.0 ? true : false
let isIPhone4_or_less: Bool = DLScreenHeight < 568.0 ? true : false





//利用全局函数,自定义log
func DLLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent): [L:\(line)]-\(method):  \(message)")
    #endif
}


