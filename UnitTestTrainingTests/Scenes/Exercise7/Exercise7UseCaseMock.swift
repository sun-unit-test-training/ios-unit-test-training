//
//  AB.swift
//  UnitTestTrainingTests
//
//  Created by Dung Khuat on 9/15/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import ValidatedPropertyKit
import Dto

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    
    var fee = (standardFee: 500.0, quickFee: 0.0)
    var cartAmount: String?
    var isPremiumMember = false
    var isQuickDeliver = false
    var isCalculationFeeCalled = false
    
    var isvalidateCardAmountCalled = false
    var validateCartAmountSuccess = ValidationResult.success(())
    
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double) {
        self.isCalculationFeeCalled = true
        self.isQuickDeliver = dto.isQuickDeliver
        self.isPremiumMember = dto.isPremiumMember
        self.cartAmount = dto.cartAmount
        return fee
    }
    
    func validateCardAmount(_ amount: String) -> ValidationResult {
        isvalidateCardAmountCalled = true
        return validateCartAmountSuccess
    }
    
}
