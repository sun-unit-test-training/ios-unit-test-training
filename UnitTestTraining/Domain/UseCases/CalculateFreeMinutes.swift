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

struct CalculateFreeMinutesDto: Dto {
    
    // swiftlint:disable:next
    @Validated(.isNumber(message: "Must input number"))
    var moneySpentString: String? = ""
    var isWatchMovie: Bool = false
    var moneySpent: Double = 0.0
    
    var validatedProperties: [ValidatedProperty] {
        return [_moneySpentString]
    }
}

extension CalculateFreeMinutesDto {
    static func validateMoneyAmount(_ amount: String) -> Result<String, ValidationError> {
        return CalculateFreeMinutesDto()._moneySpentString.isValid(value: amount)
    }
}

protocol CalculatingFreeMinutes {

}

extension CalculatingFreeMinutes {
    
    func validateMoneyAmount(_ amount: String) -> ValidationResult {
        return CalculateFreeMinutesDto.validateMoneyAmount(amount).mapToVoid()
    }
    
    func calculateFreeMinutes(dto: CalculateFreeMinutesDto) -> Double {
        let freeMinute: Double
        
        if dto.moneySpent < 2000 {
            freeMinute = dto.isWatchMovie ? 180 : 0
        } else if dto.moneySpent < 5000 {
            freeMinute = dto.isWatchMovie ? 240 : 60
        } else {
            freeMinute = dto.isWatchMovie ? 300 : 120
        }
        
        return freeMinute
    }
}
