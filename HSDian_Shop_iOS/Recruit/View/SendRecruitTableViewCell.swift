//
//  SendRecruitTableViewCell.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/6/19.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class SendRecruitTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
    }
    
    func updateSendRecuitModel(sendRecuitModel model:SendRecuitModel?) {
        nameTitle.text = model?.titleName
        content.text = model?.content
    }
    private func prepareViews() {
        contentView.addSubview(nameTitle)
        contentView.addSubview(content)
        nameTitle.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(10)
            make.width.equalTo(80)
        }
        content.snp.makeConstraints { (make) in
            make.left.equalTo(nameTitle.snp.right).offset(20)
            make.top.bottom.equalTo(nameTitle)
            make.right.equalTo(-10)
        }
    }
    
    //     MARK: - GUIs
    lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    lazy var titleImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var content:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
}

