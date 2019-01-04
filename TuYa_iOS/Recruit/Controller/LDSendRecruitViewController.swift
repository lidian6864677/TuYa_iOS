//
//  LDSendRecruitViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/19.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
private let SendRecruitTableViewCellIdentifier = "SendRecruitTableViewCell_Identifier";

class LDSendRecruitViewController: BaseViewController {
    private lazy var recuitModelArray: [[SendRecuitModel]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLeftNavigationBackItem()
        self.navigationItem.title = "发布普通职位"
        getData()
        view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    private func getData() {
        recuitModelArray = SendRecuitDataManager.share.getSendRecitData()
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
        tableView.separatorStyle = .none
        tableView.register(SendRecruitTableViewCell.self, forCellReuseIdentifier: SendRecruitTableViewCellIdentifier)
        return tableView
    }()
    
}

extension LDSendRecruitViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return recuitModelArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recuitModelArray[section].count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == recuitModelArray.count-1{
            return UIView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: 150))
        }else{
            return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == recuitModelArray.count-1{
            return 150
        }else{
            return 10
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SendRecruitTableViewCell = tableView.dequeueReusableCell(withIdentifier: SendRecruitTableViewCellIdentifier, for: indexPath) as! SendRecruitTableViewCell
//        cell.textLabel?.text = recuitModelArray[indexPath.section][indexPath.row].titleName;
        cell.updateSendRecuitModel(sendRecuitModel: recuitModelArray[indexPath.section][indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = recuitModelArray[indexPath.section][indexPath.row]
        switch model.optionType {
        case .normal?:
            DLLog("选择")
        case .state?:
            DLLog("a ")
        default: break
        }
    }
}

