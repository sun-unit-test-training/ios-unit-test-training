//
//  CaculatingTransportationFee.swift
//  UnitTestTrainingTests
//
//  Created by Dung Khuat on 9/14/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

protocol CaculatingTransportationFee {
    
}

extension CaculatingTransportationFee {
    func calculationFee(isPremiumMember: Bool,
                        isQuickDeliver: Bool,
                        isCartAmountGreaterThan5000: Bool) -> (standardFee: Double, quickFee: Double) {
        var standardDeliver = 500.0
        var quickDeliver = 0.0
        if isCartAmountGreaterThan5000 || isPremiumMember {
            standardDeliver = 0.0
        }
        if isQuickDeliver {
            quickDeliver = 500.0
        }
        return (standardDeliver, quickDeliver)
    }
}
