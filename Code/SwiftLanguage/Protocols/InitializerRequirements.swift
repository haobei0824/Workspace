//
//  InitializerRequirements.swift
//  Protocols
//
//  Created by Csy on 2020/10/8.
//

import Foundation

protocol InitProtocol {
    init()
}

class InitProtocolClass: InitProtocol {
    required init() {
        print("InitProtocolClass conform InitProtocol")
    }
}
