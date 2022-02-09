//
//  ClockViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/18.
//

import UIKit

class ClockViewController: UIViewController {
    
    // 那這個 static 有什麼差別 A:無論生成了多少這個型別的實體，型別屬性都只有唯一一份
    static let shared = ClockViewController()
    
    let clockView:ClockView = .init(frame: CGRect(x: 0, y: 44, width: 375, height: 500))
       
    var alarmArray: Array = [Alarm](){
        didSet {
            print(alarmArray.count)
            clockView.tableView.reloadData()
        }
    }
    
    //MARK: - LifeCycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = clockView
        setTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {

    }
    
    func setTableView(){
        clockView.tableView.delegate = self
        clockView.tableView.dataSource = self
        clockView.tableView.register(AlarmTableViewCell.self, forCellReuseIdentifier: AlarmTableViewCell.reuseIdentifier)
    }
    
    

    // MARK: - button
    @IBAction func edit(_ sender: Any) {
        
    }
    
    @IBAction func add(_ sender: Any) {
        let vc = AddClockTableViewController.instantiate()
        print(vc.alarm)
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
}

//MARK:-setTableViewDelegate,DataSource
extension ClockViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(alarmArray)
        
        return alarmArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.reuseIdentifier) as! AlarmTableViewCell
//        cell.configuration(alarm: alarmArray[indexPath.row])
        let cell: AlarmTableViewCell = tableView.dequeueReusableCell(withIdentifier:  AlarmTableViewCell.reuseIdentifier, for: indexPath) as! AlarmTableViewCell
        cell.configuration(alarm: alarmArray[indexPath.row])
        
        return cell
    }

}


