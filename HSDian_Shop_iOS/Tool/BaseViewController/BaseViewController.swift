//
//  BaseViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/11.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    private let HiddenNavigationBarViewControllersStringName:[String] = ["DLJobViewController","JobSearchViewController", "RecruitViewController"]
    private var HiddenNavigationBarViewControllers: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getClsName()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view.
    }
    func getClsName(){
        for vcName in HiddenNavigationBarViewControllersStringName {
            let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            // 拼接类名的完整格式,即namespace.类名,vcName即控制器的类名
            let clsName = "\(namespace).\(vcName)"
            HiddenNavigationBarViewControllers.append(clsName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///  返回按钮
    func setLeftNavigationBackItem(){
        let leftButton:UIButton = UIButton(type: UIButtonType.custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftButton.contentHorizontalAlignment = .left
        leftButton.setImage(UIImage(named: "back_image_black"), for: UIControlState.normal)
        leftButton.addTarget(self, action: #selector(clickedLeftNavigationItem), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
  
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        var isShowNavPage = HiddenNavigationBarViewControllers.contains(viewController.classForCoder.description())
        if navigationController.visibleViewController?.classForCoder.description() == BaseTabBarViewController.classForCoder().description() {
            isShowNavPage = true
        }
        //        self.navigationController?.navigationBar.isHidden = isShowNavPage
        self.navigationController?.setNavigationBarHidden(isShowNavPage, animated: true)
    }
    
    
    
    /// 右侧Nav按钮 文字  类型
    /// - Parameter title: 名字
    func setRightNavgationItemWithTitle(title:String){
        self.setRightNavgationItem(title: title, image: nil)
    }
    
    /// 右侧Nav按钮 图片 类型
    /// - Parameter image: image
    func setRightNavgationItemWithImage(image:UIImage){
        self.setRightNavgationItem(title: nil, image: image)
    }
    private func setRightNavgationItem(title:String?, image:UIImage?){
        let rightButton:UIButton = UIButton(type: .custom)
        if let title = title{
            let length = title.count
            rightButton.frame = CGRect(x: 0, y: 0, width: 15*length, height: 44)
            rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            rightButton.setTitle(title, for: .normal)
            rightButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        }
        if let image = image {
            rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
            rightButton.setImage(image, for: .normal)
        }
        rightButton.contentHorizontalAlignment = .right
        rightButton.addTarget(self, action: #selector(clickRightNavgationItem), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    @objc func clickRightNavgationItem() {
        DLLog("   ")
    }
    @objc func clickedLeftNavigationItem(){
        if (self.presentingViewController != nil) {
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

//MARK: UIGestureRecognizerDelegate
extension BaseViewController {
    //是否允许手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer{
            return self.navigationController!.viewControllers.count > 1
        }
        return true
    }
}


