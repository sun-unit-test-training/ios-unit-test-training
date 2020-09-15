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
    var cartAmount = 5000.0
    var isPremiumMember = false
    var isQuickDeliver = false
    var isCalculationFeeCalled = false
    
    func calculationFee(isPremiumMember: Bool,
                        isQuickDeliver: Bool,
                        cartAmount: Double) -> (standardFee: Double, quickFee: Double) {
     self.isCalculationFeeCalled = true
     self.isQuickDeliver = isQuickDeliver
     self.isPremiumMember = isPremiumMember
     self.cartAmount = cartAmount
     return fee
    }
    
    func validateCardAmount(_ amount: String) -> String {
        return ""
    }
    
}
