//
//  ProductListViewController.swift
//  01-Products
//
//  Created by jiayou on 2021/3/5.
//

import UIKit

let kProductCellIdentifier = "kProductCellIdentifier"

class ProductListViewController: UIViewController {
    var tableView : UITableView!
    var products = [ProductItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.products.append(ProductItem(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"))
        self.products.append(ProductItem(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"))
        self.products.append(ProductItem(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"))
        self.products.append(ProductItem(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4"))
        self.products.append(ProductItem(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"))
        self.products.append(ProductItem(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"))
        self.products.append(ProductItem(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"))
        self.products.append(ProductItem(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4"))
        
        self.tableView = UITableView(frame: CGRect(origin: CGPoint.zero, size: self.view.bounds.size), style: .plain)
        self.tableView.backgroundColor = .blue
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kProductCellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView .reloadData()
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = self.products[indexPath.row]
        
        cell.textLabel?.text = item.name;
        cell.imageView?.image = UIImage(named: item.cellImageName)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kProductCellIdentifier, for: indexPath)
        
        return cell
    }
    
    
}
