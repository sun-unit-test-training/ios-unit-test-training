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

struct BadmintonGameDto: Dto {
    
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

extension BadmintonGameDto {
    
    init(isMale: Bool, playDate: Date, age: Int) {
        self.isMale = isMale
        self.playDate = playDate
        self.age = age
        self.ageString = String(describing: age)
    }
    
    static func validateAge(_ ageString: String) -> Result<String, ValidationError> {
        return BadmintonGameDto()._ageString.isValid(value: ageString)
    }
}

protocol CalculateBadmintonFee {
    
}

extension CalculateBadmintonFee {
    func validateAge(_ age: String) -> ValidationResult {
        return BadmintonGameDto.validateAge(age).mapToVoid()
    }
    
    func calculatePlayFee(dto: BadmintonGameDto) -> Double {
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
