//
//  ClotherOrder.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

struct ClotherOrder {
    var items = [ClotherOrderItem]()
    
    var havingWhiteShirt: Bool {
        return items.contains(where: { $0.type == .whiteShirt && $0.total > 0 })
    }
    
    var havingTie: Bool {
        return items.contains(where: { $0.type == .tie && $0.total > 0 })
    }
    
    var totalItemsCount: Int {
        return items.reduce(0) { $0 + $1.total }
    }
    
    mutating func add(_ addedItem: ClotherOrderItem) {
        items = items.map { item in
            if item.type == addedItem.type {
                return ClotherOrderItem(total: item.total + 1, type: addedItem.type)
            }
            return item
        }
    }
    
    mutating func subtract(_ subtractedItem: ClotherOrderItem) {
        items = items.map { item in
            if item.type == subtractedItem.type {
                return ClotherOrderItem(total: max(item.total - 1, 0), type: subtractedItem.type)
            }
            return item
        }
    }
}
