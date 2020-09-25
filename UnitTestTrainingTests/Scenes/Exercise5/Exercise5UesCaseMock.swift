//
//  Exercise5UesCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by can.khac.nguyen on 9/20/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import ValidatedPropertyKit
import Dto

final class Exercise5UseCaseMock: Exercise5UseCaseType {
    
    // MARK: - calculateFee
    
    var calculateFeeResult = CalculatePizzaFeeResult(fee: 1500.0, promotions: [])
    var calculateFeeIsCalled = false
    
    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult {
        calculateFeeIsCalled = true
        return calculateFeeResult
    }
    
    // MARK: - validatePizzaPrice
    
    var validationResult = ValidationResult.success(())
    var validationIsCalled = false
    
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        validationIsCalled = true
        return validationResult
    }
    
}
