//
//  RestaurantInfo.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

enum MemberRank: Int {
    case silver
    case gold
    case black
}

enum PrepaidCardType: Int {
    case value3000 = 3000
    case value5000 = 5000
    case value10000 = 10000
    
    init(segmentIndex: Int) {
        self = segmentIndex == 0 ? .value3000 : segmentIndex == 1 ? .value5000 : .value10000
    }
}

struct RestaurantPromotion {
    let discount: Int
    let haveCoupon: Bool
}
