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
    
    // swiftlint:disable:next
    @Validated(.isValidAge(message: "Độ tuổi từ 0 - 120 tuổi"))
    var ageString: String? = ""
    
    var isMale = false
    var playDate = Date()
    var age = 0

    var validatedProperties: [ValidatedProperty] {
        return [_ageString]
    }
}

extension CalculateBadmintonFeeDto {
    
    init(isMale: Bool, playDate: Date, age: Int) {
        self.isMale = isMale
        self.playDate = playDate
        self.age = age
        self.ageString = String(describing: age)
    }
    
    static func validateAge(_ ageString: String) -> Result<String, ValidationError> {
        return CalculateBadmintonFeeDto()._ageString.isValid(value: ageString)
    }
}
