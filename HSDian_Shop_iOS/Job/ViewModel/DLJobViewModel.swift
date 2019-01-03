//
//  FriendViewModel.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/18.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import SwiftyJSON
import RxCocoa
import ObjectMapper
class DLJobViewModel {
    /// 获取顶部轮播图 图片
    func getTopImage() -> Observable<[JobTopImageModel]> {
//        return GetNetworkJobData.rx.request(.GetHomeTopImage)
//            .mapObject(JobTopImage.self)
//            .map{ $0.imageArray ?? [] }
//            .asObservable()
        return GetNetworkJobData.rx.request(.GetHomeTopImage).mapArray(JobTopImageModel.self).asObservable()
    }
    //获取工作列表数据
//    func GetJobList(page:String) -> Observable<[JobModel]> {
//        return GetNetworkJobData.rx.request(.GetJobList(page))
//        .mapObject(Job.self)
//        .map{ $0.jobArray ?? []}
//        .asObservable()
//    }
    func GetJobList(page:String) -> Observable<[JobModel]> {
        return GetNetworkJobData.rx.request(.GetJobList(page)).mapArray(JobModel.self).asObservable()
    }
    
//
//    //获取歌曲列表数据
//    func loadPlaylist(channelId:String) -> Observable<Playlist> {
//        return DouBanProvider.rx.request(.playlist(channelId))
//            .mapObject(Playlist.self)
//            .asObservable()
//    }
//
//    //获取频道下第一首歌曲
//    func loadFirstSong(channelId:String) -> Observable<Song> {
//        return loadPlaylist(channelId: channelId)
//            .filter{ $0.song.count > 0}
//            .map{ $0.song[0] }
//    }
}
