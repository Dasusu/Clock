//
//  MainTabbarViewController.swift
//  Clock
//
//  Created by Dasu on 2022/2/10.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView() {
        
    // 建立四個變數存放ViewController 提供以下做設定
        let worldClockVC = WorldClockViewController()
        let alarmVC = ClockViewController()
        let stopWatchVC = StopWatchViewController()
        let timerVC = TimerViewController()
    // 設定四個ViewController在Tabbar上面顯示的圖片
        worldClockVC.tabBarItem.image = UIImage(systemName: "network")
        alarmVC.tabBarItem.image = UIImage(systemName: "alarm.fill")
        stopWatchVC.tabBarItem.image = UIImage(systemName: "stopwatch.fill")
        timerVC.tabBarItem.image = UIImage(systemName: "timer")
    // 設定四個ViewController在Tabbar上面顯示的文字
        worldClockVC.title = "世界時鐘"
        alarmVC.title = "鬧鐘"
        stopWatchVC.title = "碼表"
        timerVC.title = "計時器"
        
        
        
        // 產生 view controller
//        for t in Tab.allCases {
//            makeTabController(vc: t.vc, image: t.image, title: t.title)
//        }
        
        
        
    // 鬧鐘上有 NavigationBar 所以把鬧鐘設定成 NavigationController
        let navAlarm = UINavigationController(rootViewController: alarmVC)
        // 讓 NavigationBar 不透明
        navAlarm.navigationBar.isTranslucent = false
        // 設定 NavigationBar 背景顏色
        navAlarm.navigationBar.barTintColor = .black
        // 設定 文字顏色
        navAlarm.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Tabbar 背景色
        self.tabBar.barTintColor = .black
        // Tabbar 文字色
        self.tabBar.tintColor = .orange
        
        // 設定四個 ViewController 依序加進 TabbatController 裡面
        setViewControllers([worldClockVC, navAlarm, stopWatchVC, timerVC], animated: false)
    }
    
//    private func makeTabController(vc: UIViewController,
//                                   image: UIImage?,
//                                   title: String) -> UIViewController {
//        let nav = UINavigationController(rootViewController: vc)
//        vc.tabBarItem.image = image
//        vc.title = title
//        return nav
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//enum Tab: CaseIterable {
//    case A, B, C, D
//
//    var image: UIImage? {
//        switch self {
//        case .A:
//            return UIImage(systemName: "network")
//        case .B:
//            return UIImage(systemName: "alarm.fill")
//        case .C:
//            return UIImage(systemName: "stopwatch.fill")
//        case .D:
//            return UIImage(systemName: "timer")
//        }
//    }
//}
