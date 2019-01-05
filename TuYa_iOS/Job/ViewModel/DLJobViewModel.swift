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
    
    /// 获取宋朝古诗词
    func GetSongPoetry(page: String) -> Observable<[VerseModel]> {
        return GetNetworkJobData.rx.request(.GetSongPoetry(page)).mapArray(VerseModel.self).asObservable()
    }
    
    /// 随机单句诗词推荐
    func GetSinglePoetry() -> Observable<VerseModel> {
        return GetNetworkJobData.rx.request(.GetSinglePoetry).mapObject(VerseModel.self).asObservable()
    }
    
    /// 随机一首诗词推荐
    func GetRecommendPoetry() -> Observable<JsonDataModel> {
        return GetNetworkJobData.rx.request(.GetRecommendPoetry).mapJsonData(JsonDataModel.self).asObservable()
    }
    
    /// 音乐电台详情接口：
    func GetRecommendPoetry(channelName: String) -> Observable<MusicChannelDetailModel> {
        return GetNetworkJobData.rx.request(.GetMusicBroadcastingDetails(channelName)).mapObject(MusicChannelDetailModel.self).asObservable()
    }
    
}
