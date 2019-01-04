//
//  DLReviewingViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/1.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import XLPagerTabStrip
private let ReviewingTableViewCellIdentifier = "ReviewingTableViewCell_Identifier"
class DLReviewingViewController: BaseViewController {
    private var page = 1
    private var dataArray: [String] = []
    public var itemInfo: IndicatorInfo = "全部"
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = "职位状态"
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(tableView)
        SetHeaderRefresh(vc: self, selector: #selector(refresh), tableView: tableView)

        // Do any additional setup after loading the view.
    }
    
    @objc func refresh() {
        page = 1
        getData()
    }
    @objc func loadMore() {
        page += 1
        getData()
    }
    
    func getData() {
        if dataArray.count > 0 {
            SetFooterRefresh(vc: self, selector: #selector(loadMore), tableView: self.tableView)
        }
        
        endRefreshWithData(dataArray: dataArray as NSArray, page: page, tableView: self.tableView)
    }
    

    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: DLScreenHeight - DLTabBarHeight - DLnavigationBarHeight - DLStatusBarHeight - DLStripBarButtonHeight), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
//        tableView.register(DLJobTableViewCell.self, forCellReuseIdentifier: DLJobTableViewCellIdentifier)
        tableView.register(ReviewingTableViewCell.self, forCellReuseIdentifier: ReviewingTableViewCellIdentifier)
        return tableView
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension DLReviewingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = ReviewingTableViewCell(style: .default, reuseIdentifier: ReviewingTableViewCellIdentifier)
        let cell: ReviewingTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReviewingTableViewCellIdentifier, for: indexPath) as! ReviewingTableViewCell
        cell.setData()
        return cell
        
    }
    
}
extension DLReviewingViewController: IndicatorInfoProvider{
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//        return IndicatorInfo(title: "My Child title")
//    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
}
