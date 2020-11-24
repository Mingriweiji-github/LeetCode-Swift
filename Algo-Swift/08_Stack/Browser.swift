//
//  Browser.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/24.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
///两个栈使用浏览器前进后退
struct Browser {
    ///存储前进的page
    private var forwardArray = [String]()
    ///存储后退的page
    private var backArray = [String]()

    var currentURL: String? { return forwardArray.last }

    init(url: String) {
        forwardArray.append(url)
    }
    ///前进
    mutating func goForward(url: String) {
        forwardArray.append(url)
    }

    ///后退
    mutating func goBack() {
        backArray.append(forwardArray.popLast()!)
    }
}
