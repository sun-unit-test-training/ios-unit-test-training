//
//  CaculatingTransportationFeeDto.swift
//  UnitTestTraining
//
//  Created by Dung on 9/15/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

struct CaculatingTransportationFeeDto: Dto {
    
    @Validated(.isNumber(message: "Must input number"))
    
    var cartAmountString: String? = ""
    
    var isPremiumMember: Bool = false
    var isQuickDeliver: Bool = false
    var cartAmount: Double = 0.0
    
    var validatedProperties: [ValidatedProperty] {
        return [_cartAmountString]
    }
    
}

extension CaculatingTransportationFeeDto {
    static func validateCartAmount(_ amount: String) -> Result<String, ValidationError> {
        return CaculatingTransportationFeeDto()._cartAmountString.isValid(value: amount)
    }
}
