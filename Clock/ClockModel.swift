//
//  ClockModel.swift
//  Clock
//
//  Created by Dasu on 2021/11/24.
//

import Foundation
import UIKit

//struct ClockData{
//    var morningOrNoon: String = "上午"
//    var time: String = "0:00"
//    var tagText: String = "鬧鐘"
//    var switchButton = false
//    var laterMind: Bool? = true
//    var ringSound: String? = "雷達"
//    var slectDays: Set<RepeatDays> = []
//
//
//
//}

struct Alarm {
    var date: Date = Date()
    var name: String = "鬧鐘"
    var isOpened = true
    var switchButton = false
    var selectDays: Set<RepeatDays> = []
    
    enum RepeatDays:Int,CaseIterable {
        case sunday = 0,monday,tuesday,wednesday,thursday,friday,saturday
        var dayString: String{
            switch self{
            case .sunday:
                return "星期日"
            case .monday:
                return "星期一"
            case .tuesday:
                return "星期二"
            case .wednesday:
                return "星期三"
            case .thursday:
                return "星期四"
            case .friday:
                return "星期五"
            case .saturday:
                return "星期六"
            }
        }
    }
    
    
    var dateString: String {
        let format = DateFormatter()
        return format.string(from: date)
    }
    
    var repeatText: String? {
        switch selectDays {
        case [.saturday, .sunday]:
            return "週末"
        case Set(RepeatDays.allCases):
            return "每日"
        case [.monday,.tuesday,.wednesday,.thursday,.friday]:
            return "平日"
        case []:
            return "永不"
        default:
            let text = selectDays
                .sorted(by: {$0.rawValue > $1.rawValue})
                .map({$0.dayString})
                .joined(separator: ", ")
            return text
        }
        
    }
    
}

//var data = ClockData() {
//    didSet {
//        tableView.reloadData()
//    }
//}


//class AddClockCellData {

//    enum CellData:Int,CaseIterable {
//        case repeatTime = 0
//        case clockTag
//        case remindSound
//        case remindLater
//        var titleName:(title:String,detail:Any) {
//            switch self {
//            case .repeatTime:
//                return (title:"重複", detail:"永不")
//            case .clockTag:
//                return (title:"標籤", detail:"鬧鐘")
//            case .remindSound:
//                return (title:"提示聲", detail:"雷達")
//            case .remindLater:
//                return (title:"稍後提醒", detail:Bool())
//            }
//        }
//        }
//    }



//    var addClockDetail: [String] = ["永不","鬧鐘","雷達",""]
//    var addClockTitle: [String] = ["重複","標籤","提示聲","稍後提醒"]
//    var clockCellDataOne = (title: "重複",detail: "永不")
//    var clockCellDataTwo = (title: "標籤",detail: "鬧鐘")
//    var clockCellDataThree = (title: "提示聲",detail: "雷達")
//    let clockCellDataFour = (title: "稍後提醒",object: UISwitch())

//    var tuples: [(String, DetailType)] = [
//        ("重複", .text("永不")),
//        ("標籤", .text("鬧鐘")),
//        ("提示聲", .text("雷達")),
//         ("稍後提醒", .uiSwitch(false))
//    ]
//}
//
//enum DetailType {
//    case text(String?)
//    case uiSwitch(Bool)


//var tuples: [(String, DetailType)] = [
//    ("重複", .text("永不")),
//    ("標籤", .text("鬧鐘")),
//    ("提示聲", .text("雷達")),
//     ("稍後提醒", .uiSwitch(false))
//]

//tuples[1].0
//
//switch tuples[1].1 {
//case .text(let text):
//case .uiSwitch(let bool):
//}


//enum title:Int,CaseIterable{
//    case repeatTime = 0,label,reminadSound,remindlater
//
//}
//

