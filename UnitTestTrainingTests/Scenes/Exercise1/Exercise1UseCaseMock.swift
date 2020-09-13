//
//  Exercise1UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift

final class Exercise1UseCaseMock: Exercise1UseCaseType {
    
    // MARK: - calculateBeerPrice
    
    var calculateBeerPriceCalled = false
    var calculateBeerPriceReturnValue = 490.0
    var usingVoucher = false
    var isInPromotionTime = false
    
    func calculateBeerPrice(usingVoucher: Bool, isInPromotionTime: Bool) -> Double {
        calculateBeerPriceCalled = true
        self.usingVoucher = usingVoucher
        self.isInPromotionTime = isInPromotionTime
        return calculateBeerPriceReturnValue
    }
}
