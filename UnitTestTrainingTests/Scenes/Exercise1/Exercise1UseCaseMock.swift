//
//  Exercise1UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import Foundation
import Dto

final class Exercise1UseCaseMock: Exercise1UseCaseType {
    // MARK: - calculateBeerPrice
    
    var calculateBeerPriceCalled = false
    var calculateBeerPriceReturnValue = 490.0
    var usingVoucher = false
    var purchaseTime = Date()
    
    func calculateBeerPrice(dto: BeerOrderDto) -> Double {
        calculateBeerPriceCalled = true
        self.usingVoucher = dto.usingVoucher
        self.purchaseTime = dto.purchaseTime
        return calculateBeerPriceReturnValue
    }
}
