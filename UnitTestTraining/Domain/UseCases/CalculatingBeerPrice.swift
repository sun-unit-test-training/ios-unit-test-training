//
//  CalculatingBeerPrice.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

protocol CalculatingBeerPrice {

}

extension CalculatingBeerPrice {
    func calculateBeerPrice(usingVoucher: Bool, isInPromotionTime: Bool) -> Double {
        let price: Double
        
        if usingVoucher {
            price = 100
        } else if isInPromotionTime {
            price = 290
        } else {
            price = 490
        }
        
        return price
    }
}
