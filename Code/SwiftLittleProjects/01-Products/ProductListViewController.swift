//
//  ProductListViewController.swift
//  01-Products
//
//  Created by jiayou on 2021/3/5.
//

import UIKit


class ProductListViewController: UIViewController {
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: CGRect(origin: CGPoint.zero, size: self.view.bounds.size), style: .plain)
        self.tableView.backgroundColor = .blue;
        self.view .addSubview(self.tableView)
    }
}
