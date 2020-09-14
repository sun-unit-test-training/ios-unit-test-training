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
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}

protocol CaculatingClotherDiscount {

}

extension CaculatingClotherDiscount {
    func getDiscount(clothers: [ClotherOrderItem]) -> String {
        let total = clothers.reduce(0, { $0 + $1.total })
        let haveWhiteShirt = (clothers.first(where: { $0.type == .whiteShirt })?.total ?? 0) > 0
        let haveTie = (clothers.first(where: { $0.type == .tie })?.total ?? 0) > 0
        
        if total >= 7 {
            if haveWhiteShirt {
                return haveTie ? "12%" : "7%"
            }
            return "7%"
        } else if haveWhiteShirt {
            return haveTie ? "5%" : "0%"
        }
        return "0%"
    }
    
    func getClotherData() -> [ClotherOrderItem] {
        return [
            ClotherOrderItem(type: .whiteShirt),
            ClotherOrderItem(type: .tie),
            ClotherOrderItem(type: .other)
        ]
    }
    
    func minus(dto: CaculatingClotherDiscountDto) -> [ClotherOrderItem] {
        return dto.currentClothers.map { item in
            if item.type == dto.clother.type {
                return ClotherOrderItem(total: dto.clother.total - 1, type: dto.clother.type)
            } else {
                return item
            }
        }
    }
    
    func add(dto: CaculatingClotherDiscountDto) -> [ClotherOrderItem] {
        return dto.currentClothers.map { item in
            if item.type == dto.clother.type {
                return ClotherOrderItem(total: dto.clother.total + 1, type: dto.clother.type)
            } else {
                return item
            }
        }
    }
}
