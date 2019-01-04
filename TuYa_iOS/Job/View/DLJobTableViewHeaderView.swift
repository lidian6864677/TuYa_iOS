//
//  DLJobTableViewHeaderView.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/22.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class DLJobTableViewHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: LUIs
    private func prepareViews() {
        
        //轮播图加载
//        let pointY = 44 + UIApplication.shared.statusBarFrame.size.height
//        let cycleView : CycleView = CycleView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
//        cycleView.delegate = self
//        cycleView.mode = .scaleAspectFill
//        //本地图片测试--加载网络图片,请用第三方库如SDWebImage等
//        cycleView.imageURLStringArr = ["banner01.jpg", "banner02.jpg", "banner03.jpg", "banner04.jpg"]
//        tableView.tableHeaderView = cycleView
//
        
        addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    // MARK: GUIs
    /// 头部背景
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "home_top_image_01")
        return imageView
    }()
   
  
}
