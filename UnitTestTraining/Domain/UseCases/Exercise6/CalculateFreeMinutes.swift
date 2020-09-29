//
//  CalculateFreeMinute.swift
//  UnitTestTraining
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

struct TayHoOrderDto: Dto {
    @Validated(.isNumber(message: "Must input number"))
    var moneySpent: String? = ""  // swiftlint:disable:this let_var_whitespace

    var moneySpentValue: Double {
        return moneySpent.flatMap { Double($0) } ?? 0.0
    }
    
    var watchingMovie: Bool = false
    
    var validatedProperties: [ValidatedProperty] {
        return [_moneySpent]
    }
}

extension TayHoOrderDto {
    static func validateMoneyAmount(_ amount: String) -> Result<String, ValidationError> {
        return TayHoOrderDto()._moneySpent.isValid(value: amount)
    }
}

protocol CalculatingFreeMinutes {

}

extension CalculatingFreeMinutes {
    
    func validateMoneyAmount(_ amount: String) -> ValidationResult {
        return TayHoOrderDto.validateMoneyAmount(amount).mapToVoid()
    }
    
    func calculateFreeMinutes(dto: TayHoOrderDto) -> Double {
        guard dto.validationError == nil else { return 0 }
        
        let freeMinute: Double
        
        if dto.moneySpentValue < 2000 {
            freeMinute = dto.watchingMovie ? 180 : 0
        } else if dto.moneySpentValue < 5000 {
            freeMinute = dto.watchingMovie ? 240 : 60
        } else {
            freeMinute = dto.watchingMovie ? 300 : 120
        }
        
        return freeMinute
    }
}
