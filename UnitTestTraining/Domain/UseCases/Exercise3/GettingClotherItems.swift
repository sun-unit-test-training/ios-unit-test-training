//
//  GettingClotherItems.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

protocol GettingClotherItems {
    
}

extension GettingClotherItems {
    func getClotherItems() -> [ClotherOrderItem] {
        return [
            ClotherOrderItem(type: .whiteShirt),
            ClotherOrderItem(type: .tie),
            ClotherOrderItem(type: .other)
        ]
    }
}

