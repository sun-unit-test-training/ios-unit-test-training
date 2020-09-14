//
//  AB.swift
//  UnitTestTrainingTests
//
//  Created by Dung Khuat on 9/15/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//


@testable import UnitTestTraining
import RxSwift

final class Exercise7UseCaseMock: Exercise7UseCaseType {
    var fee = (standardFee: 500.0, quickFee: 0.0)
    var isCalculationFeeCalled = false
    var isPremiumMember = false
    var isQuickDeliver = false
    var isCartAmountGreaterThan5000 = false
    
    func calculationFee(isPremiumMember: Bool,
                        isQuickDeliver: Bool,
                        isCartAmountGreaterThan5000: Bool) -> (standardFee: Double, quickFee: Double) {
        self.isCalculationFeeCalled = true
        self.isQuickDeliver = isQuickDeliver
        self.isPremiumMember = isPremiumMember
        self.isCartAmountGreaterThan5000 = isCartAmountGreaterThan5000
        return fee
    }
}
