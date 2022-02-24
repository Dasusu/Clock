//
//  TextFieldTestViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/17.
//

import UIKit

protocol TextFieldTestViewControllerDelegate: AnyObject {
    func updateAlarmLabel(_ tagText:String)
}

class TextFieldTestViewController: UIViewController{

    
    weak var updateAlarmLabelDelegate: TextFieldTestViewControllerDelegate?
    
    var tagTextForClock: UITextField = {
       let tagTextForClock = UITextField()
        tagTextForClock.text = "鬧鐘"
        tagTextForClock.textColor = .white
        tagTextForClock.backgroundColor = .darkGray
        tagTextForClock.clearButtonMode = .whileEditing
        tagTextForClock.borderStyle = .roundedRect
        tagTextForClock.font = UIFont.systemFont(ofSize: 20)
        tagTextForClock.translatesAutoresizingMaskIntoConstraints = false
        return tagTextForClock
    }()
    
    var tagText: String = "" {
        didSet{
            updateAlarmLabelDelegate?.updateAlarmLabel(tagText)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tagTextForClock.text = tagText
//        tagTextForClock.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setView() {
        self.view.backgroundColor = .black
        self.title = "標籤"
        self.navigationController?.navigationBar.tintColor = .orange
        view.addSubview(tagTextForClock)
        tagTextForClock.snp.makeConstraints { make in
            make.center.left.right.equalTo(self.view)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let text = tagTextForClock.text{
            if text == "" {
                self.tagText = "鬧鐘"
            }else{
                self.tagText = text
            }
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        if let alarm = alarm {
//            tagTextForClock.text = alarm.name
//        }
//    }
//}
//
//extension TextFieldTestViewController: UITextFieldDelegate{
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let alarmModel = alarm {
//            alarm!.name = textField.text ?? "鬧鐘"
//            updateAlarmLabelDelegate?.updateAlarmLabel(textField.text ?? "鬧鐘")
//        }
//    }
}

