//
//  AboutViewController.swift
//  01-Products
//
//  Created by jiayou on 2021/3/5.
//

import UIKit

class AboutViewController: UIViewController {
    var fullImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullImageView = UIImageView()
        self.fullImageView.image = UIImage(named: "header-contact")
        self.view.addSubview(self.fullImageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeInsets = self.view.safeAreaInsets
        self.fullImageView.frame = CGRect(x: safeInsets.left, y: safeInsets.top, width: (self.view.bounds.size.width - safeInsets.left - safeInsets.right), height: 250)
    }
    
    
}
