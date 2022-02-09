//
//  AlarmTableViewCell.swift
//  Clock
//
//  Created by Dasu on 2022/1/19.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "AlarmCell"
    
    var timeLabel: UILabel = {
       let timeLabel = UILabel()
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        timeLabel.font = .systemFont(ofSize: 50)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
//    let myLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.textAlignment = .center
//        return label
//    }()
    
    var tagAndRepeatText: UILabel = {
        let tagAndRepeatLabel = UILabel()
        tagAndRepeatLabel.textColor = .white
        tagAndRepeatLabel.textAlignment = .center
        tagAndRepeatLabel.font = .systemFont(ofSize: 18)
        tagAndRepeatLabel.translatesAutoresizingMaskIntoConstraints = false
        return tagAndRepeatLabel
    }()
    
    var switchIsOn: UISwitch = {
        let switchIsOn = UISwitch()
        switchIsOn.translatesAutoresizingMaskIntoConstraints = false
        return switchIsOn
    }()
    
    lazy var labelStackView: UIStackView = {
        let labelStackView = UIStackView(arrangedSubviews: [timeLabel,tagAndRepeatText])
        labelStackView.axis = .vertical
        return labelStackView
    }()
    
    
    lazy var mainStackView: UIStackView = {
       let mainStackView = UIStackView(arrangedSubviews: [labelStackView, switchIsOn])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillEqually
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        self.contentView.addSubview(mainStackView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    // Autolayout
    private func commonInit(){
        mainStackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
//        labelStackView = UIStackView(arrangedSubviews: [timeLabel,tagAndRepeatText])
//        labelStackView.axis = .vertical
//        mainStackView = UIStackView(arrangedSubviews: [labelStackView, switchIsOn])
//        mainStackView.axis = .horizontal
//        self.contentView.addSubview(mainStackView)
//        labelStackView.snp.makeConstraints { make in
//            make.leading.top.bottom.equalToSuperview()
//            make.center.equalToSuperview()
//            make.trailing.equalTo(switchIsOn)
            
            //好像不用寫這些 因為你用stackview 他會自動layout
            //你的mainStackview還是要寫 因為他不在stackview裡面
//        }
//        mainStackView.snp.makeConstraints { make in
//            make.leading.top.trailing.bottom.equalToSuperview()
//            make.center.equalToSuperview()
//        }
    }
    // 調用上面有東西 跟 model 裡面的資料連動
    public func configuration(alarm:Alarm){
        timeLabel.text = "\(alarm.date)"
        tagAndRepeatText.text = "\(alarm.name)"
        switchIsOn.isOn = alarm.switchButton
    }

}
