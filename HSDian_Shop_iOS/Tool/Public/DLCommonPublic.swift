//
//  DLCommonPublic.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/30.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import MJRefresh

func SetHeaderRefresh(vc: UIViewController, selector: Selector, tableView: UITableView) {
    let header = MJRefreshGifHeader(refreshingTarget: vc, refreshingAction: selector)
    let imageArr = NSMutableArray.init()
    for i in 1...2 {
        let loadImage = UIImage(named: "tianyao" + "\(i)")
        imageArr.add(loadImage ?? UIImage())
    }
    let upImg = UIImage(named: "tianyao1")
    let idleImageArr = NSMutableArray()
    idleImageArr.add(upImg ?? UIImage())
    header?.setImages(idleImageArr as! [Any], for: .idle)
    header?.setImages(idleImageArr as! [Any], for: .pulling)
    header?.setImages(imageArr as! [Any], for: .refreshing)
    header?.lastUpdatedTimeLabel.isHidden = true
    header?.stateLabel.isHidden = true
    tableView.mj_header = header
    tableView.mj_header.beginRefreshing()
}

func SetFooterRefresh(vc: UIViewController, selector: Selector, tableView: UITableView) {
    let footer = MJRefreshAutoNormalFooter(refreshingTarget: vc, refreshingAction: selector)
    footer?.setTitle("上拉加载更多", for: .idle)
    footer?.setTitle("正在加载", for: .refreshing)
    footer?.setTitle("没有更多数据了", for: .noMoreData)
    tableView.mj_footer = footer
}

func endRefreshWithData(dataArray: NSArray, page: NSInteger, tableView: UITableView){
    if page == 1{
        if dataArray.count == 0{
            /// 第一页数据为空
            tableView.mj_footer = nil
        }
        if tableView.mj_header != nil {
            tableView.mj_header.endRefreshing()
        }
    }else{
        if dataArray.count == 0{
            /// 不是第一页数据
            if tableView.mj_footer != nil {
                tableView.mj_footer .endRefreshingWithNoMoreData()
            }
        }else{
            if tableView.mj_footer != nil {
                tableView.mj_footer.endRefreshing()
            }
        }
    }
    tableView.reloadData()
}
func endReftrsWithError(tableView: UITableView){
        tableView.mj_header.endRefreshing()
        tableView.mj_footer.endRefreshing()
}

