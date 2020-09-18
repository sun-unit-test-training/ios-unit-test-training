//
//  CalculateBadmintonFee.swift
//  UnitTestTraining
//
//  Created by Dung Khuat on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import RxSwift
import Dto
import ValidatedPropertyKit

protocol CalculateBadmintonFee {
    
}

extension CalculateBadmintonFee {
    func validateAge(_ age: String) -> ValidationResult {
        return CalculateBadmintonFeeDto.validateAge(age).mapToVoid()
    }
    
    func calculatePlayFee(dto: CalculateBadmintonFeeDto) -> Double {
        guard dto.validationError == nil else { return 0.0 }
        
        if dto.age < 13 {
            return 1800.0 / 2
        }
        
        if dto.playDate.dayInWeek() == .tuesday {
            return 1200.0
        }
        
        if !dto.isMale && dto.playDate.dayInWeek() == .friday {
            return 1400.0
        }
        
        if dto.age > 65 {
            return 1600.0
        }
        
        return 1800.0
    }
}
