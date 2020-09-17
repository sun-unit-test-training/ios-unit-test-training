//
//  CalculateBadmintonFeeDto.swift
//  UnitTestTraining
//
//  Created by Dung Khuat on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

struct CalculateBadmintonFeeDto: Dto {
    var isMale = false
    var playDate = Date()
    
    @Validated(.isValidAge(message: "Độ tuổi từ 0 - 120 tuổi"))
    
    var age: String? = ""
    
    var validatedProperties: [ValidatedProperty] {
        return [_age]
    }
    
}

extension CalculateBadmintonFeeDto {
    static func validateAge(_ age: String) -> Result<String, ValidationError> {
        return CalculateBadmintonFeeDto()._age.isValid(value: age)
    }
}
