//
//  DLJobNavView.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/23.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class DLJobNavView: UIView {
    private var canEdit: Bool? = false
    override convenience init(frame: CGRect) {
        self.init(frame: frame, canEdit:false)
    }
    init(frame: CGRect, canEdit: Bool) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.canEdit = canEdit
        if self.canEdit! {
            prepareViewCanNotEdit()
        }else{
            prepareViewCanEdit()
        }
        settingLayer()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func prepareViewCanNotEdit() {
        addSubview(topNavView)
        addSubview(searchButton)
        addSubview(cityButton)
        addSubview(cancleButton)
        addSubview(searchTextField)
        
        topNavView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        //        20 23
        searchButton.snp.makeConstraints { (make) in
            make.left.equalTo(80)
            make.right.equalTo(-60)
            make.bottom.equalTo(-8)
            make.height.equalTo(33)
        }
        cityButton.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(-8)
            make.height.equalTo(33)
            make.right.equalTo(searchButton.snp.left)
        }
        cancleButton.snp.makeConstraints { (make) in
            make.top.equalTo(cityButton)
            make.right.equalTo(0)
            make.bottom.equalTo(-8)
            make.left.equalTo(searchButton.snp.right)
        }
        searchTextField.snp.makeConstraints { (make) in
            make.right.equalTo(searchButton).offset(-10)
            make.left.equalTo(searchButton).offset(15)
            make.top.bottom.equalTo(searchButton)
        }
        searchButton.setTitle("", for: .normal)
        topNavView.alpha = 1
        sizeToFitTheButton(button: cityButton, image: cityButton.imageView?.image, title: cityButton.titleLabel?.text ?? "")
    }
    // MARK: LUIs
    private func prepareViewCanEdit(){
        addSubview(topNavView)
        addSubview(searchButton)
        topNavView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(-8)
            make.height.equalTo(33)
        }
    }
    // 设置阴影
    private func settingLayer() {
        //        self.shadowImage = UIImage()
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 4.0
    }
    @objc func clickSearchBtn() {
        let vc = JobSearchViewController()
        DLGlobalNavigationController.pushViewController(vc, animated: true)
        
    }
    
    // MARK: update
    var offsetY: CGFloat = 0.0 {
        didSet {
            let alpha = offsetY / (DLStatusBarHeight + DLnavigationBarHeight)
            topNavView.alpha = alpha
            if alpha <= 0.5 {
                searchButton.setBackgroundImage(UIImage(named:"home_top_search_Image"), for: .normal)
                searchButton.setBackgroundImage(UIImage(named:"home_top_search_Image"), for: .highlighted)
            }else{
                searchButton.setBackgroundImage(UIImage(named:"home_top_search_picture"), for: .normal)
                searchButton.setBackgroundImage(UIImage(named:"home_top_search_picture"), for: .highlighted)
            }
        }
    }
    
    func sizeToFitTheButton(button: UIButton, image: UIImage?, title: String) {
        let imageSize = image?.size ?? CGSize()
        let titleFont = button.titleLabel?.font
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        let spacing:CGFloat = 3.0
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2 + spacing), bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width * 2 + spacing))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    // MARK: GUIs
    /// nav背景
    private lazy var topNavView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.alpha = 0
        return view
    }()
    /// 搜索按钮
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.setBackgroundImage(UIImage(named:"home_top_search_picture"), for: .normal)
        button.setBackgroundImage(UIImage(named:"home_top_search_picture"), for: .highlighted)
        button.setTitle("🔍   搜索职位/公司  ", for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(clickSearchBtn), for: .touchUpInside)
        
        return button
    }()
    private lazy var searchTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "🔍   搜索职位/公司  "
        field.textAlignment = .left
        field.font = UIFont.systemFont(ofSize: 13)
        field.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return field
    }()
    private lazy var cityButton: UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "ic_drop_down")
        btn.setImage(image, for: .normal)
        btn.setTitle(" 北京", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(clickCityBtn), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(clickCityBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var cancleButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("取消", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(clickCancleBtn), for: .touchUpInside)
        return btn
    }()
    
}
//MARK: SELs
extension DLJobNavView {
    @objc func clickCancleBtn() {
        DLGlobalNavigationController.popViewController(animated: true)
    }
    @objc func clickCityBtn() {
        let vc = CitySelectorViewController()
        vc.callback = { (selectName:String) in
            print(selectName)
            self.cityButton.setTitle(" \(selectName)", for: .normal)
            self.sizeToFitTheButton(button: self.cityButton, image: self.cityButton.imageView?.image, title: self.cityButton.titleLabel?.text ?? "")
        }
        DLGlobalNavigationController.pushViewController(vc, animated: true)
    }
}

