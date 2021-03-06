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
//        switchIsOn.translatesAutoresizingMaskIntoConstraints = false
        return switchIsOn
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
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//        self.accessoryView = switchIsOn
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // Autolayout
    private func commonInit(){
        self.accessoryView = switchIsOn
        let checkMark = UIImageView(image: UIImage(systemName: "chevron.right"))
        checkMark.tintColor = .white
        self.editingAccessoryView = checkMark
        self.selectionStyle = .none
//        self.addSubview(timeLabel)
//        self.addSubview(tagAndRepeatText)
        self.backgroundColor = .black
//        textLabel?.snp.makeConstraints { make in
//                    make.top.equalToSuperview()
//                }
//        detailTextLabel?.snp.makeConstraints { make in
//            make.top.equalTo(textLabel?.snp.bottom).offset(10)
//            make.left.equalTo(textLabel?.snp.left)
//                }
//
//
        
//
//        let labelStackView = UIStackView(arrangedSubviews: [timeLabel,tagAndRepeatText])
//        labelStackView.axis = .vertical
//        // stackView ?????????????????????????????????
//        let mainStackView = UIStackView(arrangedSubviews: [labelStackView, switchIsOn])
//        mainStackView.axis = .horizontal
//        mainStackView.alignment = .center
//        mainStackView.spacing = 16
//        self.contentView.addSubview(mainStackView)
//        labelStackView.snp.makeConstraints { make in
//            make.leading.top.bottom.equalToSuperview()
//            make.center.equalToSuperview()
//            make.trailing.equalTo(switchIsOn)
//            ????????????????????? ????????????stackview ????????????layout
//            ??????mainStackview???????????? ???????????????stackview??????
//        }
//        mainStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    // ????????????????????? ??? model ?????????????????????
    public func configuration(alarm:Alarm){
        timeLabel.text = "\(alarm.dateString)"
        if alarm.repeatText == "??????"{
            tagAndRepeatText.text = "\(alarm.name)"
        }else{
            tagAndRepeatText.text = "\(alarm.name)???\(alarm.repeatText)"
        }
        switchIsOn.isOn = alarm.switchButton
    }
    
    public func configure(alarm:Alarm){
        textLabel?.font = .systemFont(ofSize: 50)
        textLabel?.textColor = .white
        textLabel?.text = alarm.dateString
        detailTextLabel?.font = .systemFont(ofSize: 18)
        detailTextLabel?.textColor = .white
        detailTextLabel?.text = alarm.alarmTitle
        switchIsOn.isOn = alarm.switchButton
    }
}
