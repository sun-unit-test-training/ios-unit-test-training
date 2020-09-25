//
//  CaculatingClotherDiscount.swift
//  UnitTestTraining
//
//  Created by nguyen.dong.son on 9/14/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct CaculatingClotherDiscountDto: Dto {
    let clother: ClotherOrderItem
    let currentClothers: [ClotherOrderItem]
}

protocol CaculatingClotherDiscount {

}

extension CaculatingClotherDiscount {
    func getDiscount(of order: ClotherOrder) -> Double {
        if order.totalItemsCount >= 7 {
            if order.havingWhiteShirt {
                return order.havingTie ? 0.12 : 0.07
            }
            return 0.07
        } else if order.havingWhiteShirt {
            return order.havingTie ? 0.05 : 0
        }
        
        return 0
    }
}
