//
//  CartAmountDto.swift
//  UnitTestTraining
//
//  Created by Dung Khuat on 9/16/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Dto
import RxSwift
import ValidatedPropertyKit

struct CartAmountDto: Dto {
    
    @Validated(.isValidCartAmount(message: "Must input number"))
    var cartAmount: String? = ""
    
    var validatedProperties: [ValidatedProperty] {
        return [_cartAmount]
    }
    
}

extension CartAmountDto {
    static func validateCartAmount(_ amount: String) -> Result<String, ValidationError> {
        return CartAmountDto()._cartAmount.isValid(value: amount)
    }
}
