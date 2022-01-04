//
//  AddClockTableViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/18.
//

import UIKit

class AddClockTableViewController: UITableViewController, Storyboarded{
    
    
    // MARK: Outlet thing
    
    @IBOutlet weak var remindLaterSwitch: UISwitch!
    @IBOutlet weak var repeatDetailLabel: UILabel!
    @IBOutlet weak var tagDetailLabel: UILabel!
    @IBOutlet weak var remindSoundDetailLabel: UILabel!
    
    @IBOutlet weak var timeUIDatePicker: UIDatePicker!{
        didSet {
            timeUIDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        }
    }
    
    
    
    
    // MARK: TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            let vc = DayForClockTableViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
    }
    
    
    
    
    
    
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        addClockCell.textLabel?.text = AddClockCellData.CellData.allCases[indexPath.row].titleName.title
//        let detailType = AddClockCellData.CellData.allCases[indexPath.row].titleName.detail
//        if detailType as? Any.Type == String.self {
//            addClockCell.detailTextLabel?.text = detailType as? String
//        }else{
//        if indexPath.row == 3 {
//            if let detailType = AddClockCellData.CellData.allCases[indexPath.row].titleName.detail as? Bool
//            {
//                self.remindLaterSwitch.isOn = detailType
//            }
//        }
//        if let detailType = AddClockCellData.CellData.allCases[indexPath.row].titleName.detail as? String
//        {
//            addClockCell.detailTextLabel?.text = detailType
//            print(indexPath.row,detailType)
//        }
//
//        return addClockCell
//    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        switch indexPath.row {
//        // 點擊第一欄時，要做什麼
//        case 0:
//            let vc = storyboard?.instantiateViewController(withIdentifier: "DayForClockTableViewController") as!  DayForClockTableViewController
//            vc.updateRepeatTextDelegate = self
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        // 點擊第二欄時，要做什麼
//        case 1:
//            let vc = storyboard?.instantiateViewController(withIdentifier: "TextFieldTestViewController") as! TextFieldTestViewController
//
//            // 讓AddAlarmViewController成為
//            // AlarmLabelViewController的updateAlarmLabelDelegate的執行者
//                vc.updateAlarmLabelDelegate = self
//
//            // 使用navigationController的pushViewController()，達到畫面由右至左的效果。
//            self.navigationController?.pushViewController(vc, animated: true)
//        // 點擊第三欄時，要做什麼
//        case 2:
//            break
//        // 點擊第四欄時，要做什麼
//        case 3:
//            break
//        default:
//            break
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
// MARK: Delegate

//extension AddClockTableViewController: SelectDayDelegate{
//    func selectDaySet(selectday: Set<RepeatDays>) {
//        selectday = selectdays
//    }
//}
