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
    func validateCardAmount(_ amount: String) -> String {
        let isValid = Double(amount) ?? 0
        return isValid > 0 ? "" : "Incorrect"
    }
    
    func calculationFee(isPremiumMember: Bool,
                        isQuickDeliver: Bool,
                        cartAmount: Double) -> (standardFee: Double, quickFee: Double) {
        var standardDeliver = 500.0
        var quickDeliver = 0.0
        if cartAmount > 5000 || isPremiumMember {
            standardDeliver = 0.0
        }
        if isQuickDeliver {
            quickDeliver = 500.0
        }
        return (standardDeliver, quickDeliver)
    }
}
