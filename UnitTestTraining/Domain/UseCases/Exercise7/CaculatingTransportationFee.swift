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

struct VietnamMartOrderDto: Dto {
    // swiftlint:disable:next
    @Validated(.isNumber(message: "Must input number"))
    var cartAmount: String? = ""
    
    var cartAmountValue: Double {
        return cartAmount.flatMap { Double($0) } ?? 0.0
    }
    
    var isPremiumMember: Bool = false
    var isQuickDeliver: Bool = false
    
    var validatedProperties: [ValidatedProperty] {
        return [_cartAmount]
    }
    
}

extension VietnamMartOrderDto {
    static func validateCartAmount(_ amount: String) -> Result<String, ValidationError> {
        return VietnamMartOrderDto()._cartAmount.isValid(value: amount)
    }
}

protocol CaculatingTransportationFee {
    
}

extension CaculatingTransportationFee {
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        return VietnamMartOrderDto.validateCartAmount(amount).mapToVoid()
    }
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        guard dto.validationError == nil else { return (0, 0) }
        
        var standardDeliver = 500.0
        var quickDeliver = 0.0
        
        if dto.cartAmountValue >= 5000 || dto.isPremiumMember {
            standardDeliver = 0.0
        }
        
        if dto.isQuickDeliver {
            quickDeliver = 500.0
        }
        
        return (standardDeliver, quickDeliver)
    }
}
