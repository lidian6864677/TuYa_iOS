//
//  BaseTabBarViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/16.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController,UITabBarControllerDelegate {
    
    private lazy var composeBtn: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "home_recruit_info_button"), for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.delegate = self
        setUpTabBar()
        setChildVc()
        setupComposBtn()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbarItems()
    }
    
    var _lastSelectedIndex: NSInteger! = 0
    
    func setupComposBtn() {
        tabBar.addSubview(composeBtn)
        composeBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        composeBtn.addTarget(self, action: #selector(clickbutton), for: .touchUpInside)
    }
     func setupTabbarItems() {
        
        //1.遍历所有的 item
        for i in 0..<tabBar.items!.count {
            
            //2. 获取 item
            let item = tabBar.items![i]
            
            //3.如果是下标值为2, 则该item不可以和用户交互
            if i == 2 {
                item.isEnabled = false
                //跳出本次循环
                continue
            }
        }
    }
    fileprivate func setUpTabBar(){
        /// 这两个很主要缺一不可
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        /// 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -3.0)
        self.tabBar.backgroundColor = UIColor.white
        //未选中
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.4078176022, green: 0.407827884, blue: 0.4078223705, alpha: 1),
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 10)], for: .selected)
        //选中
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 10)], for: .normal)
        // 设置图片选中时颜色必须设置（系统默认选中蓝色）
        UITabBar.appearance().tintColor = UIColor.black
    }
    fileprivate func setChildVc(){
//        prepareChildViewController(DLJobViewController(), title: "职位", normalImage: "TabBar0_new", selectedImage: "TabBar0_new_hover")
        prepareChildViewController(PendingTabStripViewController(), title: "职位", normalImage: "TabBar0_new", selectedImage: "TabBar0_new_hover")
        prepareChildViewController(DLJobViewController(), title: "待办", normalImage: "TabBar1_new", selectedImage: "TabBar1_new_hover")
        
        prepareChildViewController(PendingTabStripViewController(), title: "", normalImage: "", selectedImage: "")
        
        prepareChildViewController(DLMessageViewController(), title: "消息", normalImage: "TabBar2_new", selectedImage: "TabBar2_new_hover")
        prepareChildViewController(DLMeViewController(), title: "我", normalImage: "TabBar3_new", selectedImage: "TabBar3_new_hover")
    }
    
    ///  添加控制器
    fileprivate func prepareChildViewController(_ vc:UIViewController,title:String, normalImage:String, selectedImage:String){
        vc.title = title
        //        vc.tabBarItem.image = UIImage(named:normalImage)?
        vc.tabBarItem.image = UIImage(named:normalImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named:selectedImage)?.withRenderingMode(.alwaysOriginal)
        /// 更改 Tabbar的图片大小  top 和 bottom 一定要这只为相反数 否则 image大小会一直变化
        if title.isEmpty {
            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }else{
            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        }
        let baseNav = BaseNavgationController(rootViewController:vc)
        addChildViewController(baseNav)
    }
    
    
    // MARK: tabbarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //设置最近一次变更
        _lastSelectedIndex = self.selectedIndex
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if self.selectedIndex != _lastSelectedIndex{
            // 上次点击与本次不同
            let animation = CATransition()
            animation.duration = 1
            animation.type = kCATransitionReveal
            //        animation.subtype = kCATransitionFromLeft
            animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
            viewController.view.layer.add(animation, forKey: "switchView")
        }else{
            /// 这里可以点击tab的时候刷新页面
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickbutton() {
        /// 跳转
        let composeVC = RecruitViewController()
//        composeVC.view.alpha = 1
//        present(composeVC, animated: true, completion: nil)
        self.view.addSubview(composeVC.view)
        self.addChildViewController(composeVC)
//        composeVC.view.frame = self.view.bounds
//        self.addChildViewController(composeVC)

        
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

