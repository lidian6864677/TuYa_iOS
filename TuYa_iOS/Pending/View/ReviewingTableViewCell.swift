//
//  ReviewingTableViewCell.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/1.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class ReviewingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData() {
        jobName.text = "台球女仆"
    }
    func prepareviews() {
        contentView.addSubview(jobName)
        jobName.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.width.equalTo(DLScreenWidth/3*2)
        }
    }
    
    private lazy var jobName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
