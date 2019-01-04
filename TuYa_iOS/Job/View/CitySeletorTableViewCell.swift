//
//  CitySeletorTableViewCell.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class CitySeletorTableViewCell: UITableViewCell {

    
//    var callBack:(_ selectCity:String) -> () = {_ in }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCities(hotCities:[String]) {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // 动态创建城市btn
        for i in 0..<hotCities.count {
            // 列
            let column = i % 3
            /// 行
            let row = i / 3
            let btnMargin: CGFloat = 15
            let btnWidth: CGFloat = (DLScreenWidth - btnMargin*6) / 3
            let btnHeight: CGFloat = 30
            let btn = UIButton(frame: CGRect(x: btnMargin + CGFloat(column) * (btnWidth + btnMargin), y: 15 + CGFloat(row) * (btnHeight + btnMargin), width: btnWidth, height: btnHeight))
            btn.setTitle(hotCities[i], for: .normal)
            btn.setTitleColor(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1), for: .normal)
            btn.setBackgroundImage(UIImage(named: "home_top_search_picture"), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn .addTarget(self, action: #selector(clickButton(btn:)), for: .touchUpInside)
            self.addSubview(btn)
        }
    }
    @objc func clickButton(btn:UIButton){
//        DLLog(btn.titleLabel?.text)
        let selectCity: String = btn.titleLabel?.text ?? ""
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Noti_SelectedCity),)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Noti_SelectedCity), object: nil, userInfo: ["selectName":selectCity])
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
