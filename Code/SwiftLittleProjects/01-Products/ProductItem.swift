//
//  ProductItem.swift
//  01-Products
//
//  Created by jiayou on 2021/3/9.
//

import Foundation

class ProductItem {
  var name: String
  var cellImageName: String
  var fullscreenImageName: String
  
  init(name: String, cellImageName: String, fullscreenImageName: String) {
    self.name = name
    self.cellImageName = cellImageName
    self.fullscreenImageName = fullscreenImageName
  }
}
