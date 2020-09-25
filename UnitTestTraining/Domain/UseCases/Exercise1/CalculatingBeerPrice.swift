//
//  CalculatingBeerPrice.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct BeerOrderDto: Dto {
    let usingVoucher: Bool
    let purchaseTime: Date
}

protocol CalculatingBeerPrice {

}

extension CalculatingBeerPrice {
    func calculateBeerPrice(dto: BeerOrderDto) -> Double {
        let calendar = Calendar(identifier: .gregorian)
        
        let hour = calendar.component(.hour, from: dto.purchaseTime)
        let isInPromotionTime = (16...17) ~= hour  // 16:00 ~ 17:59
        
        let price: Double
        
        if dto.usingVoucher {
            price = 100
        } else if isInPromotionTime {
            price = 290
        } else {
            price = 490
        }
        
        return price
    }
}
