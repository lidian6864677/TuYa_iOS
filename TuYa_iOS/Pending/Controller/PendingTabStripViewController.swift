//
//  PendingTabStripViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/21.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PendingTabStripViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.isTranslucent = false 
        
        self.settings.style.selectedBarHeight = 3
        self.settings.style.selectedBarBackgroundColor = UIColor.clear
        super.viewDidLoad()
        addButtonBarViewSetting()
        self.settings.style.buttonBarItemFont = .systemFont(ofSize: 13)
        self.settings.style.buttonBarItemTitleColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        self.settings.style.buttonBarHeight = 45
        self.settings.style.buttonBarBackgroundColor = UIColor.white
        self.settings.style.buttonBarItemBackgroundColor = UIColor.white
        changeCurrentIndexProgressive = { /**[weak self]*/ (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat,   changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
        self.containerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.buttonBarView.snp.bottom)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-1)
        }
    }
    func addButtonBarViewSetting() {
//        let Y:CGFloat = statusBarHeight + navigationBarHeight
        self.buttonBarView.frame = CGRect(x: 0, y: 0, width: DLScreenWidth-2, height: 45)
        self.buttonBarView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        /// 选中条
        let selectview = UIView()
        selectview.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        self.buttonBarView.selectedBar.addSubview(selectview)
        selectview.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.buttonBarView.selectedBar)
            make.width.equalTo(20)
            make.centerX.equalTo(self.buttonBarView.selectedBar)
        }
        /// 分割线
        let lineView = UIView(frame: CGRect(x:0 , y: self.buttonBarView.frame.size.height-1, width: self.buttonBarView.frame.width, height: 1))
        lineView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        self.buttonBarView.addSubview(lineView)
        
    }
    // MARK: pagerTab
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = DLReviewingViewController()
        child_1.itemInfo.title = "审核中"
        let child_2  = DLReviewingViewController()
        child_2.itemInfo.title = "招聘中"
        let child_3  = DLReviewingViewController()
        child_3.itemInfo.title = "已暂停"
        let child_4  = PendingViewController()
        child_4.itemInfo.title = "已完成"
        let child_5  = PendingViewController()
        child_5.itemInfo.title = "未通过"
        return [child_1, child_2, child_3, child_4, child_5]
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
