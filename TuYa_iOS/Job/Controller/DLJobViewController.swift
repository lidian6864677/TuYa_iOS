//
//  DLJobViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/10.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import MJRefresh
private let DLJobTableViewCellIdentifier = "DLJobTableViewCell_Identifier"
class DLJobViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, CycleViewDelegate {
    //    let model = JobModel(map: )
    private var page = 1
    let disposeBag = DisposeBag()
    let viewModel  = DLJobViewModel()
    private lazy var jobModelArray: [VerseModel] = []
    private lazy var dataArray:  [JobModel] = []
    private lazy var topImageArray:  [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        else{
        self.topImageArray = DLUserDefaults.shareDLUserDefaults.getDefaultsArray(key: UserDefaults_Top_image_Banner) as! [String]
        //        }
        
        self.tableHeaderView.imageURLStringArr = topImageArray
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.topNavView)
        SetHeaderRefresh(vc: self, selector: #selector(refresh), tableView: self.tableView)
    }
    
    // MARK: GetData
    func getData() {
        
        //        viewModel.GetSinglePoetry().subscribe(onNext: { (verse) in
        //
        ////            print(verse)
        //
        //        }, onError: { (error) in
        //            NetworkHomeApi.errorMessage(error: error as! MoyaError)
        //        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        //
        //
        //
                viewModel.GetRecommendPoetry().subscribe(onNext: { (json) in
                    let data = json.result
                    if let data = data{
                        print(data)
                        print(data["content"])
                    }
                }, onError: { (error) in
                    NetworkHomeApi.errorMessage(error: error as! MoyaError)
                }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        
        
//        viewModel.GetRecommendPoetry(channelName: "public_tuijian_spring").subscribe(onNext: { (model) in
//            print(model)
//            print(model.songListModel)
//            print(model.songListModel!.first?.artist)
//
//        }, onError: { (error) in
//            NetworkHomeApi.errorMessage(error: error as! MoyaError)
//        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
//
//
        
        
        viewModel.GetSongPoetry(page: String(page)).subscribe { (event) in
            switch event{
            case .next(let models):
                if self.page == 1 {
                    self.jobModelArray.removeAll()
                }
                
                if models.count > 0 {
                    self.jobModelArray += models
                }
                if self.jobModelArray.count > 0 && self.page == 1{
                    SetFooterRefresh(vc: self, selector: #selector(self.loadMore), tableView: self.tableView)
                }
                endRefreshWithData(dataArray: self.jobModelArray as NSArray, page: self.page, tableView: self.tableView)
            case .error(let error):
                endReftrsWithError(tableView: self.tableView)
                NetworkHomeApi.errorMessage(error: error as! MoyaError)
            case .completed:
                return
            }
            
            }.disposed(by: disposeBag)
    }
    
    @objc func refresh() {
        page = 1
        getData()
    }
    @objc func loadMore() {
        page+=1
        getData()
    }
    
    // MARK: GUIs
    lazy var tableView:UITableView = {
        //        let tableViewY:CGFloat = DLStatusBarHeight + DLnavigationBarHeight
        var tableView = UITableView(frame: CGRect(x: 0, y:0 , width: DLScreenWidth, height: DLScreenHeight - DLTabBarHeight), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        //        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.register(DLJobTableViewCell.self, forCellReuseIdentifier: DLJobTableViewCellIdentifier)
        if self.topImageArray.count > 0 {
            tableView.tableHeaderView = tableHeaderView
        }
        return tableView
    }()
    /// tableViewHeaderView
    lazy var tableHeaderView: CycleView = {
        let topView = CycleView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: 250*DLScreenRate))
        topView.delegate = self
        topView.mode = .scaleAspectFill
        return topView
    }()
    /// job NavView
    lazy var topNavView: DLJobNavView = {
        let topView = DLJobNavView(frame: CGRect(x: 0, y: 0, width:DLScreenWidth, height: DLStatusBarHeight+DLnavigationBarHeight), canEdit: false)
        return topView
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK:
extension DLJobViewController {
}
// MARK: scrollViewDelegate
extension DLJobViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        if scrollView.contentOffset.y < -40 && self.topNavView.isHidden == false{
            self.topNavView.isHidden = true
        }else if scrollView.contentOffset.y > -33 && self.topNavView.isHidden == true{
            self.topNavView.isHidden = false
        }
        
        if scrollView.contentOffset.y < 0 {
            self.topNavView.offsetY = 0
        }else if scrollView.contentOffset.y < (DLStatusBarHeight + DLnavigationBarHeight){
            self.topNavView.offsetY = offsetY
        }else{
            self.topNavView.offsetY = (DLStatusBarHeight + DLnavigationBarHeight)
        }
    }
}


//MARK: CycleViewDelegate
extension DLJobViewController {
    func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
        let demoVc = JobDetailViewController()
        demoVc.title = "点击了轮播图第\(index)个图片"
        DLGlobalNavigationController.pushViewController(demoVc, animated: true)
    }
}


// MARK: tableViewDelegate&tableViewDatasource
extension DLJobViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobModelArray.count
        //        return 15
        //        return dataArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return  UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return  UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:  DLJobTableViewCell = tableView.dequeueReusableCell(withIdentifier: DLJobTableViewCellIdentifier, for: indexPath) as! DLJobTableViewCell
        //        cell.updateJobModel(jobModel: nil)
        cell.updateJobModel(verseModel: jobModelArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let jobVc = JobDetailViewController()
        DLGlobalNavigationController.pushViewController(jobVc, animated: true)
    }
}


