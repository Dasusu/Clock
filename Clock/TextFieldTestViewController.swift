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

class TextFieldTestViewController: UIViewController, Storyboarded {

    
    weak var updateAlarmLabelDelegate: TextFieldTestViewControllerDelegate?
    
    @IBOutlet weak var tagTextForClock: UITextField!
    
    var tagText: String = "" {
        didSet{
            updateAlarmLabelDelegate?.updateAlarmLabel(tagText)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagTextForClock.text = tagText
//        tagTextForClock.delegate = self
        // Do any additional setup after loading the view.
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

