//
//  ClockView.swift
//  Clock
//
//  Created by Dasu on 2022/2/8.
//

import UIKit

class ClockView: UIView {
    
    // MARK: Cell 必須在 View 裡面實例化才能有東西跑出來
    let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.separatorStyle = .singleLine
//        tableView.rowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(AlarmTableViewCell.self, forCellReuseIdentifier: AlarmTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .black
        // translatesAutoresizingMaskIntoConstrainrs 這個的功能是 告訴 iOS 自動建立放置位置得約束條件
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: 實例化
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        autoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: AutoLayOut
    
   private func autoLayOut(){
        backgroundColor = .black
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    
}

