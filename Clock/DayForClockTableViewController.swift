//
//  DayForClockTableViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/18.
//

import UIKit


protocol DayForClockTableViewControllerDelegate: AnyObject {
    func receiveSelectedDays(_ days: Set<Alarm.RepeatDays>)
}

class DayForClockTableViewController: UITableViewController{
 
    // MARK: - Table view data source
    let allDays = Alarm.RepeatDays.allCases
    
    var selectDays: Set<Alarm.RepeatDays> = [] {
        didSet {
            delegate?.receiveSelectedDays(selectDays)
        }
    }
    
    weak var delegate: DayForClockTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        self.tableView.backgroundColor = .black
        self.title = "重複"
        self.navigationController?.navigationBar.tintColor = .orange
        self.view.backgroundColor = .black
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let day = allDays[indexPath.row]
        cell.backgroundColor = .darkGray
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = day.dayString
        let isCheck = selectDays.contains(day)
        cell.accessoryType = isCheck ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day = allDays[indexPath.row]
        if selectDays.contains(day) {
            selectDays.remove(day)
        } else {
            selectDays.insert(day)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        selectRows(tableView: tableView, indexPath: indexPath)
//    }
//    func selectRows(tableView: UITableView, indexPath: IndexPath){
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let cell = tableView.cellForRow(at: indexPath)
//
//        if selectDays.contains(Alarm.RepeatDays(rawValue: indexPath.row)!){
//            selectDays.remove(Alarm.RepeatDays(rawValue: indexPath.row)!)
//        }else{
//            selectDays.insert(Alarm.RepeatDays(rawValue: indexPath.row)!)
//        }
//
//        cell?.accessoryType = (selectDays.contains(Alarm.RepeatDays(rawValue: indexPath.row)!)) ? .checkmark : .none
//    }
//
        
        
        
//        let cell = tableView.cellForRow(at: indexPath)
//
//
//        if selectday.contains(RepeatDays(rawValue: indexPath.row)!)
//        {
//            selectday.remove(RepeatDays(rawValue: indexPath.row)!)
//        }else
//        {
//            selectday.insert(RepeatDays(rawValue: indexPath.row)!)
//        }
//
//        cell?.accessoryType = (selectday.contains(RepeatDays(rawValue: indexPath.row)!)) ? .checkmark : .none
//
//        changeRepeatText()
//
//    }
//    func changeRepeatText(){
//
//        switch selectday{
//        case [.sunday,.saturday]:
//            updateRepeatTextDelegate?.updateRepeatText(repeatText: "週末")
//        case [.monday,.tuesday,.wednesday,.thursday,.friday]:
//            updateRepeatTextDelegate?.updateRepeatText(repeatText: "平日")
//        case []:
//            updateRepeatTextDelegate?.updateRepeatText(repeatText: "永不")
//        case Set(RepeatDays.allCases):
//            updateRepeatTextDelegate?.updateRepeatText(repeatText: "每天")
//        default:
//            let text = selectday.sorted(by: {(raw1, raw2) -> Bool in
//                return raw1.rawValue < raw2.rawValue}).map{ (day) -> String in
//                    "\(day.dayString)"}.joined(separator: " ")
//            updateRepeatTextDelegate?.updateRepeatText(repeatText: text)
//                }
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
