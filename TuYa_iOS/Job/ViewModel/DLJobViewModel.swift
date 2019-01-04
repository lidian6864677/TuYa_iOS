//
//  FriendViewModel.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/18.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import RxSwift
class DLJobViewModel {
    
    /// 获取顶部轮播图 图片
    func getTopImage() -> Observable<[JobTopImageModel]> {
        return GetNetworkJobData.rx.request(.GetHomeTopImage).mapArray(JobTopImageModel.self).asObservable()
    }
    
    func GetSongPoetry(page: String) -> Observable<[VerseModel]> {
        return GetNetworkJobData.rx.request(.GetSongPoetry(page)).mapArray(VerseModel.self).asObservable()
    }
    
    func GetSinglePoetry() -> Observable<VerseModel> {
        return GetNetworkJobData.rx.request(.GetSinglePoetry).mapObject(VerseModel.self).asObservable()
    }
    
    
}
