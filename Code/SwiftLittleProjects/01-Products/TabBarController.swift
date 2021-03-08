//
//  TabBarController.swift
//  01-Products
//
//  Created by jiayou on 2021/3/5.
//

import UIKit

class TabBarController : UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        // product list
        let productList = ProductListViewController()
        let navigationController = UINavigationController(rootViewController: productList)
        productList.title = "产品列表"
        
        // about
        let about = AboutViewController()
        let navigationController2 = UINavigationController(rootViewController: about)
        productList.title = "产品列表"
        about.title = "关于"
        
        // tab bar
        self.viewControllers = [navigationController, navigationController2]
    }


}
