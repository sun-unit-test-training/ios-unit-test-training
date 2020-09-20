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
    var fee: (fee: Double, promotions: [PromotionType]) = (fee: 1500.0, promotions: [])
    var priceString: String? = ""
    var receiveMethod: ReceiveMethod = .deliver
    var usingCoupon: Bool = false
    
    var calculateFeeIsCalled = false
    var validationIsCalled = false
    
    func calculateFee(dto: CalculatePizzaFeeDto) -> (fee: Double, promotions: [PromotionType]) {
        calculateFeeIsCalled = true
        self.priceString = dto.priceString
        self.receiveMethod = dto.receiveMethod
        self.usingCoupon = dto.usingCoupon
        return fee
    }
    
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        validationIsCalled = true
        return ValidationResult.success(())
    }
    
    
}
