//
//  PrProtocolDelegate.swift
//  Protocols
//
//  Created by Csy on 2020/10/29.
//

import Foundation

protocol PrRondomDelegate: AnyObject {
    func random() -> Int;
}

class PrProtocolRandomer: PrRondomDelegate {
    func random() -> Int {
        return 1
    }
}

class PrProtocolDelegateViewController {
    weak var weakDelegate: PrRondomDelegate?
    var delegate: PropertiesProtocol?
    
    func work() -> Void {
        if let randomNum =  weakDelegate?.random(){
            print("weak delegate random(): " + "\(randomNum)")
        }
        
        if let name =  delegate?.readonlyName {
            print("delegate readonlyName(): " + name)
        }
    }
}

func testProtocolDelegate() -> Void {
    let vc = PrProtocolDelegateViewController()
    let randomer = PrProtocolRandomer()
    
    vc.weakDelegate = randomer
    vc.delegate = PrPropertiesPerson()
    
    vc.work()
}
