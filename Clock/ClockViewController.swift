//
//  ClockViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/18.
//

import UIKit

class ClockViewController: UIViewController {
    
    let clockView:ClockView = .init()
    
    
    var alarms = [Alarm]() {
        didSet {
            print(alarms.count)
            clockView.tableView.reloadData()
        }
    }
    
    //MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        view = clockView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavigation()
        //        let newView = ClockView()
        //        view.addSubview(newView)
        //        newView.snp.makeConstraints { make in
        //            make.edges.equalToSuperview()
    }
    
    func setTableView(){
        clockView.tableView.delegate = self
        clockView.tableView.dataSource = self
    }
    
    func setNavigation() {
        // Left Botton
        //        let editButton = UIBarButtonItem(title: "編輯", style: .plain, target: self, action: #selector(edit))
        //        editButton.tintColor = .orange
        //        self.navigationItem.leftBarButtonItem = editButton
        self.navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.tintColor = .orange
        editButtonItem.title = "編輯"
        
        
        // Right Button
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(add))
        addButton.tintColor = .orange
        self.navigationItem.rightBarButtonItem = addButton
        
    }
    
    
    // MARK: - button
    @objc func edit() {
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        clockView.tableView.setEditing(editing, animated: true)
        switch isEditing{
        case true:
            return editButtonItem.title = "完成"
        case false:
            return editButtonItem.title = "編輯"
        }
    }
    
    
    @objc func add() {
        let vc = AddClockTableViewController(style: .insetGrouped)
        print(vc.alarm)
        vc.clockView = self
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
}




//MARK:-setTableViewDelegate,DataSource
extension ClockViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case UITableViewCell.EditingStyle.delete:
            alarms.remove(at: indexPath.row)
            clockView.tableView.reloadData()
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isEditing {
            tableView.deselectRow(at: indexPath, animated: true)
            let vc = AddClockTableViewController(style: .insetGrouped)
            vc.indexPath = indexPath
            vc.clockView = self
            let nav = UINavigationController(rootViewController: vc)

            present(nav, animated: true, completion: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(alarms)
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlarmTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.reuseIdentifier, for: indexPath) as! AlarmTableViewCell
        let alarm = alarms[indexPath.row]
        cell.configure(alarm: alarm)
        tableView.allowsSelectionDuringEditing = true
        if isEditing {
            cell.selectionStyle = .default
        }
        
        return cell
    }
    
}
