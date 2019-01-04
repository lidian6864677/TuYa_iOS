//
//  PendingViewController.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/3.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit
import SnapKit
import XLPagerTabStrip
class PendingViewController: BaseViewController,IndicatorInfoProvider {
    public var itemInfo: IndicatorInfo = "全部"
    
    private lazy var backBtn: UIButton          = UIButton()
    var labelNumber:Double = 0
    var result:UILabel!
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isTranslucent=false
//        self.navigationController?.isNavigationBarHidden=true
        // Do any additional setup after loading the view, typically from a nib.
        
        /// topLabel
        result = UILabel()
        self.view.addSubview(result)
        result.textColor = UIColor.black
        result.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(100)
        }
        result.textAlignment = .center
        result.font = UIFont.systemFont(ofSize: 30)
        result.text = "0"
        
        /// startView & startButton
        let startView = UIView()
        startView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        self.view.addSubview(startView)
        startView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width/2)
            make.left.bottom.equalTo(self.view)
            make.top.equalTo(self.view).offset(200)
        }
        
        let startButton:UIButton = UIButton()
        startView.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.center.equalTo(startView)
            make.width.height.equalTo(100)
        }
        startButton.setTitle("Start", for: .normal)
        
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        startButton.addTarget(self, action: #selector(clickStartButton), for: UIControl.Event.touchUpInside)
        
        
        
        /// endView & endButton
        let endView = UIView()
        self.view.addSubview(endView)
        endView.snp.makeConstraints { (make) in
            make.right.equalTo(self.view)
            make.width.top.bottom.equalTo(startView)
        }
        
        endView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        let endButton = UIButton()
        endView.addSubview(endButton)
        endButton.snp.makeConstraints { (make) in
            make.center.equalTo(endView)
            make.height.width.equalTo(100)
        }
        endButton.setTitle("End", for: .normal)
        endButton.addTarget(self, action: #selector(clickEndButton), for: UIControl.Event.touchUpInside)
        
        
        let resetButton = UIButton()
        self.view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.right.equalTo(self.view)
        }
        resetButton.setTitleColor(#colorLiteral(red: 0.6852758527, green: 0.6852921844, blue: 0.6852833629, alpha: 1), for: .normal)
        resetButton.setTitle("reset", for: .normal)
        resetButton.addTarget(self, action: #selector(clickResetButton), for: UIControl.Event.touchUpInside)
        
        
    }
    @objc func clickStartButton(){
        print("startButton")
        if self.timer != nil {
            self.clickEndButton()
            return
        }
        if #available(iOS 10.0, *) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                self.countDown()
            })
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        }
        
       
        self.timer.fire()
        
    }
    
    @objc func countDown() {
        self.labelNumber = self.labelNumber + 0.1
        self.result.text = String.init(format: "%.1f", self.labelNumber)
    }
    
    @objc func clickEndButton(){
        print("endButton")
        guard let timerForDistor = self.timer else {
            return
        }
        timerForDistor.invalidate()
        self.timer = nil;
    }
    
    @objc func clickResetButton(){
        print("resetButton")
        self.labelNumber = 0
        self.result.text = "0.0"
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

