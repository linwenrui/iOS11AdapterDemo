//
//  ViewController.swift
//  iOS11AdapterDemo
//
//  Created by XH-LWR on 2017/9/22.
//  Copyright © 2017年 linwenrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    
    // lazy 懒加载
    fileprivate lazy var dataList: [String] = {
        
        let list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "设置"
        createUI()
        
        // 设置标题
        navigationController?.navigationBar.prefersLargeTitles = true // @available(iOS 11.0, *)
        // 自动设置
        // UINavigationItemLargeTitleDisplayModeAutomatic
        // 大标题
        // UINavigationItemLargeTitleDisplayModeAlways
        // 小标题
        // UINavigationItemLargeTitleDisplayModeNever
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = UISearchController.init(searchResultsController: nil)
    }
    
    func createUI() {
        
        let width: CGFloat = UIScreen.main.bounds.size.width
        let height: CGFloat = UIScreen.main.bounds.size.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: width, height: height - 64), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataList[indexPath.row]
        
        return cell!
    }
    
    // MARK: - 左滑删除
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    
        return "删除"
    }
    
    // MARK: iOS11新方法删除 -> trailing 右侧删除
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteRowAction = UIContextualAction(style: .normal, title: "delete") { (action, view, finished) in
            
            if self.dataList.count > indexPath.row {
                
                self.dataList.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        deleteRowAction.image = #imageLiteral(resourceName: "z_caipu_deleteDish")
        deleteRowAction.backgroundColor = UIColor.blue
        let config = UISwipeActionsConfiguration(actions: [deleteRowAction])
        return config
    }
}

