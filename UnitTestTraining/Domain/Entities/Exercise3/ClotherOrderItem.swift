//
//  Clother.swift
//  UnitTestTraining
//
//  Created by nguyen.dong.son on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

enum ClotherType {
    case whiteShirt
    case tie
    case other
    
    var name: String {
        switch self {
        case .whiteShirt:
            return "Áo sơ mi trắng"
        case .tie:
            return "Cà vạt"
        case .other:
            return "Sản phẩm khác"
        }
    }
}

struct ClotherOrderItem {
    var total = 0
    var type: ClotherType = .other
}
