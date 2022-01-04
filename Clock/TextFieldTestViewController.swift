//
//  TextFieldTestViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/17.
//

import UIKit

protocol UpdateAlarmLabelDelegate: AnyObject {
    func updateAlarmLabel(tagTextForClock: String)
}

class TextFieldTestViewController: UIViewController {

    weak var updateAlarmLabelDelegate: UpdateAlarmLabelDelegate?
    
    @IBOutlet weak var tagTextForClock: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        if let text = tagTextForClock.text {
                    
                    if text == "" { // 若輸入框內為空白，回傳「鬧鐘」
                        updateAlarmLabelDelegate?.updateAlarmLabel(tagTextForClock:"鬧鐘")
                    }else { // 若輸入框內不為空白，回傳「輸入框內的文字」
                        updateAlarmLabelDelegate?.updateAlarmLabel(tagTextForClock: text)
                    }
                }
            }
    }
//每一個頁面都要有一個viewcontroller
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

