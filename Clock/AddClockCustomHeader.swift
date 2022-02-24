//
//  AddClockCustomHeader.swift
//  Clock
//
//  Created by Dasu on 2022/2/11.
//

import UIKit

class AddClockCustomHeader: UITableViewHeaderFooterView {

    static let reuseIdentifier = "CustomHeader"
    
    
    let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "zh_Hant_TW")
        datePicker.preferredDatePickerStyle = .wheels
//        datePicker.tintColor = .white
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
            }
        }
    }
    
    

