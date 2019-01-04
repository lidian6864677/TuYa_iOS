//
//  Prefs.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/30.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import SwiftyJSON
import RxCocoa
import ObjectMapper
import GDPerformanceView_Swift
class Prefs: NSObject {
    let disposeBag = DisposeBag()
    static let share = Prefs()
    func getTopBannerImage() {
        let viewModel  = DLJobViewModel()
        viewModel.getTopImage().subscribe { (event) in
            switch event{
            case .next(let models):
                var imageArray: [String] = []
                
                for model in models{
                    imageArray.append(model.imageUrl ?? "")
                }
                if imageArray.count > 0{
                    /// 请求成功更新本地
                    DLUserDefaults.shareDLUserDefaults.setDefaultsArray(key: UserDefaults_Top_image_Banner, saveArray: imageArray)
                    //                    self.topImageArray = imageArray
                }
                
            case .error(let error):
                NetworkHomeApi.errorMessage(error: error as! MoyaError)
            case .completed:
                return
            }
            }.disposed(by: disposeBag)
    }
    func SettingGDPerformanceMonitor() {
//        PerformanceMonitor.shared().start()
//            { (textLabel) in
//            textLabel?.backgroundColor = .orange
//            textLabel?.textColor = .white
//            textLabel?.layer.borderColor = UIColor.yellow.cgColor
//        }
//        PerformanceMonitor.shared().start()
        
    }
}









