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
        return tableView
    }()
    
    // MARK: 實例化
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.frame = frame
        self.addSubview(tableView)
        autoLayOut()
        print(tableView.frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 200
        tableView.backgroundColor = UIColor.purple
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
     
    
    // MARK: AutoLayOut
    func autoLayOut(){
        tableView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}

