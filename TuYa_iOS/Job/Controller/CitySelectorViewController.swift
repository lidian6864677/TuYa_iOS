//
//  CitySelectorViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import RxSwift
private let CitySeletorTableViewCellIdentifier = "CitySeletorTableViewCell_Identifier"
class CitySelectorViewController: BaseViewController{
    var callback:(_ selectName: String) -> () = {_ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setLeftNavigationBackItem()
        self.view.addSubview(mainTableView)
//        let titleView = UIView(frame: searchVC.searchBar.frame)
//        titleView.addSubview(searchVC.searchBar)
//        self.navigationItem.titleView = titleView
        self.navigationItem.title = "城市选择"
        NotificationCenter.default.addObserver(self, selector: #selector(selectCityName(notification:)), name: NSNotification.Name(rawValue: Noti_SelectedCity), object:nil)
    }
    
    @objc func selectCityName(notification: Notification) {
        let noti = notification.userInfo ?? [:]
        let name = noti["selectName"] ?? ""
        callback(name as! String)
        self.clickedLeftNavigationItem()
    }
//    func loadData(selectName: String?, callback:(_ text: String)->()) {
//        callback(selectName ?? "")
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: DataSource
    func getData() {
        
        
        
    }
    /// 搜索控制器
//    lazy var searchVC: UISearchController = {
//        let searchVc = UISearchController(searchResultsController: self.searchResultVC)
//        searchVc.delegate = self
//        searchVc.searchResultsUpdater = self
//        searchVc.hidesNavigationBarDuringPresentation = false
//        /**
//         * a、如果不添加下面这行代码，在设置hidesNavigationBarDuringPresentation这个属性为YES的时候，搜索框进入编辑模式会导致searchbar不可见，偏移-64; 在设置为NO的时候，进入编辑模式输入内容会导致高度为64的白条，猜测是导航栏没有渲染出来
//         b、如果添加了下面这行代码，在设置hidesNavigationBarDuringPresentation这个属性为YES的时候，输入框进入编辑模式正常显示和使用; 在设置为NO的时候，搜索框进入编辑模式导致向下偏移64，具体原因暂时未找到
//         */
//        searchVc.definesPresentationContext = true
//        //        searchVc.dimsBackgroundDuringPresentation = false
//        searchVc.searchBar.frame = CGRect(x: 0, y: 0, width: DLScreenWidth - 114, height: 30)
//        searchVc.searchBar.placeholder = "输入城市名或拼音查询"
//
//        //给searchBar中的textField添加背景图
////        [searchVc.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"backgroundImage"] forState:UIControlStateNormal];
//        //一下代码为修改placeholder字体的颜色和大小
////        UITextField * searchField = [searchVc.searchBar valueForKey:@"_searchField"];
////        [searchField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
////        [searchField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
////        searchVc.searchBar.setValue(<#T##value: Any?##Any?#>, forKey: @"_placeholderLabel.font")
////        let searchField = searchVc.value(forKey: "searchField") as! UITextField
////        searchField.setValue(UIFont.systemFont(ofSize: 13), forKey: "placeholderLabel.font")
//
////        searchVc.searchBar.backgroundImage = UIImage(named:"home_top_search_picture")
////        searchVc.searchBar.backgroundImage = UIImage(named:"home_top_image")
//        searchVc.searchBar.setSearchFieldBackgroundImage(UIImage(named: "home_top_search_picture"), for: .normal)
//        searchVc.searchBar.delegate = self
//        return searchVc
//    }()
    lazy var searchResultVC: ResultTableViewController = ResultTableViewController()
    
    // MARK: GUIs
    /// 全部城市数据
    lazy var allCitiesDict: [String: [String]] = {
        let path = Bundle.main.path(forResource: "Cities_All.plist", ofType: nil)
        let dict = NSDictionary(contentsOfFile: path ?? "") as? [String: [String]]
        return dict ?? [:]
    }()    
    /// 热门城市数据
    lazy var hotCities: [String] = {
        let path = Bundle.main.path(forResource: "Cities_Hot.plist", ofType: nil)
        let array = NSArray(contentsOfFile: path ?? "") as? [String]
        return array ?? []
    }()
    /// 标题数组
    lazy var titleArray: [String] = {
        var array = [String]()
        for (key, value) in allCitiesDict {
            array.append(key)
        }
        // 标题排序
        array.sort()
        array.insert("热门", at: 0)
        array.insert("当前", at: 0)
        return array
    }()
    
    /// tableView
    private lazy var mainTableView:UITableView = {
        let tableView = UITableView(frame: KUIDefaultFrame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.separatorStyle = .none
        tableView.register(CitySeletorTableViewCell.self, forCellReuseIdentifier: CitySeletorTableViewCellIdentifier)
        tableView.sectionIndexColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        tableView.sectionIndexBackgroundColor = UIColor.clear
//        tableView.tableHeaderView = tableHeaderView
        return tableView
    }()
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: UItableViewDataSource & UItableViewDelegate
extension CitySelectorViewController:  UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let btnMargin: CGFloat = 15
        let btnHeight: CGFloat = 30
        if indexPath.section == 0 {
            return btnHeight + 2 * btnMargin
        }else if indexPath.section == 1 {
            let row = (hotCities.count - 1) / 3
            return (btnHeight + 2 * btnMargin) + (btnMargin + btnHeight) * CGFloat(row)
        }else{
            let key = titleArray[indexPath.section]
            let array = allCitiesDict[key] ?? [""]
            let row = (array.count - 1) / 3
            return (btnHeight + 2 * btnMargin) + (btnMargin + btnHeight) * CGFloat(row)
        }
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArray
    }
    // MARK: row高度
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = CitySeletorTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: CitySeletorTableViewCellIdentifier)
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 1{
            let cell = CitySeletorTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: CitySeletorTableViewCellIdentifier)
            cell.selectionStyle = .none
            cell.updateCities(hotCities: hotCities)
            return cell
        }else{
            /// 不使用复用cell加载
            let cell = CitySeletorTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: CitySeletorTableViewCellIdentifier)
            cell.selectionStyle = .none
            let key = titleArray[indexPath.section]
            cell.updateCities(hotCities: allCitiesDict[key] ?? [""])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: section头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: 30))
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.width-20, height: 0.5)
        layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.layer.addSublayer(layer)
        
        let title = UILabel(frame: CGRect(x: 15, y: 0, width: DLScreenWidth - 15, height: 30))
        var titleArr = titleArray
        titleArr[0] = "当前城市"
        titleArr[1] = "热门城市"
        title.text = titleArr[section]
        title.textColor = #colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1)
        title.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(title)
        view.backgroundColor = UIColor.white
        
        return view
    }
    
}


//
//// MARK: UISearchResultsUpdating
//extension CitySelectorViewController: UISearchResultsUpdating, UISearchControllerDelegate {
//    func updateSearchResults(for searchController: UISearchController) {
//        getSearchResultArray(searchBarText: searchController.searchBar.text ?? "")
//    }
//
//    func willPresentSearchController(_ searchController: UISearchController) {
//        searchController.searchBar.showsCancelButton = false
//    }
//
//    func presentSearchController(_ searchController: UISearchController) {
//        searchController.searchBar.showsCancelButton = false
//    }
//
//    // 隐藏取消按钮
//    func didPresentSearchController(_ searchController: UISearchController) {
//        searchController.searchBar.showsCancelButton = false
//    }
//
//}
//
//// MARK: searchBar 代理方法
//extension CitySelectorViewController: UISearchBarDelegate {
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        return true
//    }
//}
//// MARK: 搜索逻辑
//extension CitySelectorViewController {
//     func getSearchResultArray(searchBarText: String) {
//        var resultArray:[String] = []
//        if searchBarText == "" {
//            searchResultVC.resultArray = resultArray
//            searchResultVC.tableView.reloadData()
//            return
//        }
//        // 传递闭包 当点击’搜索结果‘的cell调用
//        searchResultVC.callBack = { [weak self] in
//            // 搜索完成 关闭resultVC
//            self?.searchVC.isActive = false
//        }
//        // 中文搜索
//        if searchBarText.isIncludeChineseIn() {
//            // 转拼音
//            let pinyin = searchBarText.chineseToPinyin()
//            // 获取大写首字母
//            let first = String(pinyin[pinyin.startIndex]).uppercased()
//            guard let dic = allCitiesDict[first] else {
//                return
//            }
//            for str in dic {
//                if str.hasPrefix(searchBarText) {
//                    resultArray.append(str)
//                }
//            }
//            searchResultVC.resultArray = resultArray
//            searchResultVC.tableView.reloadData()
//        }else {
//            // 拼音搜索
//            // 若字符个数为1
//            if searchBarText.characters.count == 1 {
//                guard let dic = allCitiesDict[searchBarText.uppercased()] else {
//                    return
//                }
//                resultArray = dic
//                searchResultVC.resultArray = resultArray
//                searchResultVC.tableView.reloadData()
//            }else {
//                guard let dic = allCitiesDict[searchBarText.first().uppercased()] else {
//                    return
//                }
//                for str in dic {
//                    // 去空格
//                    let py = String(str.chineseToPinyin().characters.filter({ $0 != " "}))
//                    let range = py.range(of: searchBarText)
//                    if range != nil {
//                        resultArray.append(str)
//                    }
//                }
//                // 加入首字母判断 如 cq => 重庆 bj => 北京
//                if resultArray.count == 0 {
//                    for str in dic {
//                        // 北京 => bei jing
//                        let pinyin = str.chineseToPinyin()
//                        // 获取空格的index
//                        let a = pinyin.characters.index(of: " ")
//                        let index = pinyin.index(a!, offsetBy: 2)
//                        // offsetBy: 2 截取 bei j
//                        // offsetBy: 1 截取 bei+空格
//                        // substring(to: index) 不包含 index最后那个下标
//                        let py = String(pinyin.prefix(upTo: index))
//
////                            pinyin.substring(to: index)
//
//                        /// 获取第二个首字母
//                        ///
//                        ///     py = "bei j"
//                        ///     last = "j"
//                        ///
//
//                        let last = py.suffix(from: py.index(py.endIndex, offsetBy: -1))
////                            py.substring(from: py.index(py.endIndex, offsetBy: -1))
//                        /// 两个首字母
//                        let pyIndex = String(pinyin[pinyin.startIndex]) + last
//
//                        if searchBarText.lowercased() == pyIndex {
//                            resultArray.append(str)
//                        }
//                    }
//                }
//                searchResultVC.resultArray = resultArray
//                searchResultVC.tableView.reloadData()
//            }
//        }
//    }
//}

