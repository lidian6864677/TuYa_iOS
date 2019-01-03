//
//  JobSearchViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class JobSearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        prepareViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        
        
    }
    func prepareViews(){
        self.view.addSubview(topNavView)
    }
     lazy var searchResultVC: ResultTableViewController = ResultTableViewController()

    // MARK: GUIs
    /// job NavView
    private lazy var topNavView: DLJobNavView = {
        let topView = DLJobNavView(frame: CGRect(x: 0, y: 0, width:DLScreenWidth, height: DLStatusBarHeight+DLnavigationBarHeight), canEdit: true)
        return topView
    }()
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


