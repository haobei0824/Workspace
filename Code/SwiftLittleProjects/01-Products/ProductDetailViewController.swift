//
//  ProductDetailViewController.swift
//  01-Products
//
//  Created by jiayou on 2021/3/11.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var productItem : ProductItem;
    var fullImageView : UIImageView
    
    
    
    init(item: ProductItem) {
        productItem = item
        fullImageView = UIImageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        self.fullImageView.image = UIImage(named: self.productItem.fullscreenImageName)
        self.view.addSubview(self.fullImageView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let safeInsets = self.view.safeAreaInsets
        
        self.fullImageView.frame = CGRect(x: safeInsets.left, y: safeInsets.top, width: (self.view.bounds.size.width - safeInsets.left - safeInsets.right), height: self.view.bounds.size.height - safeInsets.top - safeInsets.bottom)
    }
}
