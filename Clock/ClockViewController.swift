//
//  ClockViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/18.
//

import UIKit

class ClockViewController: UIViewController {
    
    // MARK: - gggg
    @IBAction func edit(_ sender: Any) {
        
    }
    
    @IBAction func add(_ sender: Any) {
        let vc = AddClockTableViewController.instantiate()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
