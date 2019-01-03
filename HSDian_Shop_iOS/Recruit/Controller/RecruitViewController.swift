//
//  RecruitViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/1.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class RecruitViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle  = .custom
        prepareViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    private func prepareViews() {
        //首先创建一个模糊效果
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurEffect = UIBlurEffect(style: .light)
        let blurEffect = UIBlurEffect(style: .extraLight)
        
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        //设置模糊视图的大小（全屏）
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        
        //创建并添加vibrancy视图
        let vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        
        vibrancyView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        blurView.contentView.addSubview(vibrancyView)
        
        //将文本标签添加到vibrancy视图中
        vibrancyView.contentView.addSubview(sendNormalRecruit)
        vibrancyView.contentView.addSubview(sendSuperRecruit)
        
        
        self.view.addSubview(blurView)
    }
    
    
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: DLScreenWidth, height: DLScreenHeight))
        imageView.image = UIImage(named: "recruit_bg_image")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var sendNormalRecruit: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 0, y: DLScreenHeight/2-40, width: DLScreenWidth, height: 50)
        button.addTarget(self, action: #selector(clickNormalSend), for: .touchUpInside)
        button.setTitle("发布普通职位", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        return button
    }()
    lazy var sendSuperRecruit: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 0, y: sendNormalRecruit.frame.maxY+40, width: DLScreenWidth, height: 50)
        button.addTarget(self, action: #selector(clickSuperSend), for: .touchUpInside)
        button.setTitle("发布专业职位", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        return button
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeItemBtnClick()
    }
    
    deinit {
        DLLog("页面被释放了")
    }

}

extension RecruitViewController {
    
    @objc fileprivate func closeItemBtnClick() {
//        dismiss(animated: true, completion: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        
    }
    @objc fileprivate func clickNormalSend(){
        DLLog("发布普通职位")
        let vc = LDSendRecruitViewController()
        DLGlobalNavigationController .pushViewController(vc, animated: true)
        closeItemBtnClick()
    }
    @objc fileprivate func clickSuperSend(){
        DLLog("发布高级职位")
        closeItemBtnClick()
    }
    
}
