//
//  CaculatingTransportationFeeDto.swift
//  UnitTestTraining
//
//  Created by Dung on 9/15/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct CaculatingTransportationFeeDto: Dto {
    
    var isPremiumMember: Bool
    var isQuickDeliver: Bool
    var cartAmount: Double
    
    init(isPremiumMember: Bool, isQuickDeliver: Bool, cartAmount: Double) {
        self.isPremiumMember = isPremiumMember
        self.isQuickDeliver = isQuickDeliver
        self.cartAmount = cartAmount
    }
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}

extension CaculatingTransportationFeeDto {
    
}
