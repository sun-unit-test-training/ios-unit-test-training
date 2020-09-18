//
//  CaculatingTransportationFee.swift
//  UnitTestTrainingTests
//
//  Created by Dung Khuat on 9/14/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Dto
import RxSwift
import ValidatedPropertyKit

protocol CaculatingTransportationFee {
    
}

extension CaculatingTransportationFee {
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        return CaculatingTransportationFeeDto.validateCartAmount(amount).mapToVoid()
    }
    
    func calculationFee(dto: CaculatingTransportationFeeDto) -> (standardFee: Double, quickFee: Double) {
        var standardDeliver = 500.0
        var quickDeliver = 0.0
        
        if dto.isPremiumMember {
            standardDeliver = 0.0
        }
        
        if dto.isQuickDeliver {
            quickDeliver = 500.0
        }
        
        if dto.cartAmount > 5000 {
            standardDeliver = 0.0
            quickDeliver = 0.0
        }
        return (standardDeliver, quickDeliver)
    }
}
