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
    var cartAmountString: String? = ""
    
    var isPremiumMember: Bool = false
    var isQuickDeliver: Bool = false
    var cartAmount: Double = 0.0
    
    var validatedProperties: [ValidatedProperty] {
        return [_cartAmountString]
    }
    
}

extension VietnamMartOrderDto {
    static func validateCartAmount(_ amount: String) -> Result<String, ValidationError> {
        return VietnamMartOrderDto()._cartAmountString.isValid(value: amount)
    }
}

protocol CaculatingTransportationFee {
    
}

extension CaculatingTransportationFee {
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        return VietnamMartOrderDto.validateCartAmount(amount).mapToVoid()
    }
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        var standardDeliver = 500.0
        var quickDeliver = 0.0
        if dto.cartAmount >= 5000 || dto.isPremiumMember {
            standardDeliver = 0.0
        }
        if dto.isQuickDeliver {
            quickDeliver = 500.0
        }
        return (standardDeliver, quickDeliver)
    }
}
