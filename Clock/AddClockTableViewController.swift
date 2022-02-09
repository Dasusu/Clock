//
//  AddClockTableViewController.swift
//  Clock
//
//  Created by Dasu on 2021/11/18.
//

import UIKit


class AddClockTableViewController: UITableViewController, Storyboarded{
    
    
    //TODO: - 這裡用錯了，導致資料只能存一筆
    //這個也影響你的tableview不能運 所以不能這樣引用嗎?
    //對
    //因為viewcontroller是 Class
    /*
     你每次按新增的時候，會建立一個新的AddClockTableViewController實體 -> alarmArray.count == 0
     這個實體也會建立一個新的ClockViewController實體 -> alarmArray.count == 0
     
     接著你用ClockView.alarmArray.append(alarm)這個的時候，所有的ClockViewController參考都會被更改 -> alarmArray.count == 1
     然後你會dismiss，上面的AddClockTableViewController實體跟ClockViewController實體都會被消滅
     
     
     所以我就是在一個 0 1 0 1 的 loop就對了
     對 了解 
     
     
     */
    var ClockView = ClockViewController.shared
    
    
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
    

    var alarm = Alarm() {
        didSet {
            tableView.reloadData()
        }
    }
    
    let cellData = AddClockCellData.CellData.allCases
    
    
    
    // MARK: TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        
        switch indexPath.row{
        case 0:
            cell.detailTextLabel?.text = alarm.repeatText
        case 1:
            cell.detailTextLabel?.text = alarm.name
        case 2:
            cell.detailTextLabel?.text = "雷達"
        case 3:
            let switchButton = UISwitch()
            switchButton.isOn = alarm.switchButton
            cell.accessoryView = switchButton
        default:
            break
            
        }
        let titleName = cellData[indexPath.row].titleName
        cell.backgroundColor = .darkGray
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = titleName
        cell.detailTextLabel?.textColor = .white
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            let vc = DayForClockTableViewController.instantiate()
            vc.selectDays = alarm.selectDays
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = TextFieldTestViewController.instantiate()
            vc.tagText = alarm.name
//            vc.alarm = alarm
            vc.updateAlarmLabelDelegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            break
        case 3:
            break
        default:
            break
        }
    }
    
    // MARK: DatePicker
    
    
    
    
    
    
    
    
    
    // MARK: Navgation Button
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Save(_ sender: UIBarButtonItem) {
        ClockView.alarmArray.append(alarm)
        dismiss(animated: true, completion: nil)
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

// MARK: - DayForClockTableViewControllerDelegate
extension AddClockTableViewController: DayForClockTableViewControllerDelegate {
    
    func receiveSelectedDays(_ days: Set<Alarm.RepeatDays>) {
        self.alarm.selectDays = days
    }
}

extension AddClockTableViewController: TextFieldTestViewControllerDelegate {
    
    func updateAlarmLabel(_ tagText: String) {
        self.alarm.name = tagText
    }
}
