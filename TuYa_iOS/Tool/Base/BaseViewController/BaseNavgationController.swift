//
//  BaseNavgationController.swift
//  HSDian_iOS
//
//  Created by Dian on 2018/5/12.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class BaseNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationBar.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        
        /// 设置底部阴影
        // 设置底部阴影
        self.navigationBar.shadowImage = UIImage()
//        self.navigationBar.layer.shadowColor = UIColor.black.cgColor
//        self.navigationBar.layer.shadowOffset = CGSize(width: 2, height: 2)
//        self.navigationBar.layer.shadowOpacity = 0.1
//        self.navigationBar.layer.shadowRadius = 4.0
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true //跳转之后隐藏
        }
        super.pushViewController(viewController, animated: true)
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
