//
//  Exercise8UseCaseMock.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import ValidatedPropertyKit
import Dto

final class Exercise8UseCaseMock: Exercise8UseCaseType {
    
    var fee = 0.0
    var isMale = false
    var age = "0"
    var date = Date()
    
    var isValidateAgeCalled = false
    var validateAgeSuccess = ValidationResult.success(())
    var isCalculatePlayFeeCalled = false
    
    func validateAge(_ age: String) -> ValidationResult {
        isValidateAgeCalled = true
        return validateAgeSuccess
    }
    
    func calculatePlayFee(dto: CalculateBadmintonFeeDto) -> Double {
        isCalculatePlayFeeCalled = true
        self.age = dto.age ?? "0"
        self.isMale = dto.isMale
        self.date = dto.playDate
        return fee
    }
    
}
