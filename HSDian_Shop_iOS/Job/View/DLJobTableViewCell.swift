//
//  DLJobTableViewCell.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/22.
//  Copyright © 2018年 Dian. All rights reserved.
//

import UIKit

class DLJobTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: update
    func updateJobModel(jobModel model:JobModel?) {
        jobName.text = model?.jobName ?? "暴打韩诗雨张双不限时间"
        addressLabel.text = model?.address ?? "上海"
        timeLabel.text = model?.time ?? "5/22 - 5/30"
        moneyLabel.text = model?.money ?? "15/小时"
        settlementLabel.text = model?.settlement ?? "日结"
        companyIcon.image = UIImage(named: model?.companyIcon ?? "TabBar0_new_hover")
        companyName.text = model?.companyName ?? "北京超级犀牛科技有限公司"
    }
    // MARK: LUIs
    private func prepareViews() {
        contentView.addSubview(jobName)
        contentView.addSubview(addressLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(moneyLabel)
        contentView.addSubview(settlementLabel)
        contentView.addSubview(companyIcon)
        contentView.addSubview(companyName)
        contentView.addSubview(separatorLine)
        jobName.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.width.equalTo(DLScreenWidth/3*2)
        }
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobName.snp.bottom).offset(10)
            make.left.equalTo(jobName)
            make.width.equalTo(50)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel)
            make.left.equalTo(addressLabel.snp.right).offset(10)
            make.width.equalTo(70)
        }
        moneyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobName)
            make.right.equalTo(-20)
            make.width.equalTo(DLScreenWidth/3-20)
        }
        settlementLabel.snp.makeConstraints { (make) in
            make.right.equalTo(moneyLabel)
            make.top.equalTo(moneyLabel.snp.bottom).offset(10)
        }
        companyIcon.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(15)
            make.left.equalTo(jobName)
            make.width.height.equalTo(30)
        }
        companyName.snp.makeConstraints { (make) in
            make.centerY.equalTo(companyIcon)
            make.left.equalTo(companyIcon.snp.right).offset(10)
        }
        separatorLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(8)
        }
    }
    
    
    // MARK: - GUIs
    /// 结算方式
    private lazy var jobName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    /// 地址
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    /// 时间
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    /// 价格
    private lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        return label
    }()
    /// 结算方式
    private lazy var settlementLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    /// 公司图标
    private lazy var companyIcon: UIImageView = UIImageView(image: UIImage(named: ""))
    /// 公司名称
    private lazy var companyName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    /// 分割线
    private lazy var separatorLine: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.9370916486, green: 0.9369438291, blue: 0.9575446248, alpha: 1)
        return label
    }()
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
